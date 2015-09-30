class BulbsController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :set_bulb, only: [:get, :update]

  discoverable \
    get: { obs: :true }

  GRP_PREFIX = "http://pit.itm.uni-luebeck.de/aktor/SVA_08-SS15#"
  PREFIX = "http://pit.itm.uni-luebeck.de/"
  META = <<END
@prefix pit: <http://pit.itm.uni-luebeck.de/>
@base <http://pit.itm.uni-luebeck.de/aktor/SVA_08-SS15>

<#pi>
  a pit:Device;
  pit:hasGroup "SVA_08-SS15";
  pit:hasIP "141.83.175.249";
  pit:hasLabel "Philips Hue Bulb";
  pit:hasSensor <#bulb> .
  pit:hasActor <#bulb> .

<#bulb>
  a pit:Sensor;
  a pit:Actor;
  pit:hasDescription "Philips Hue Bulb";
  pit:hasStatus <#isOn> ;
  pit:hasStatus <#hasBrightness> ;
  pit:hasStatus <#hasColor> ;
  pit:hasInterface <http://141.83.175.249/>;
  pit:hasDoku <https://github.com/hauptbenutzer/pi-projekt-it/blob/master/doc/milestone4/Webserver.md> .
END

  def get
    respond_to do |format|
      format.json {
        render json: @bulb
      }
      format.turtle {
        response = META + [
            get_value_triple("isOn", @bulb.on),
            get_value_triple("hasColor", @bulb.color),
            get_value_triple("hasBrightness", @bulb.brightness)].join(". ")
        render text: response, content_type: "n3/turtle"
      }
    end

  end

  def update
    respond_to do |format|
      format.turtle { render text: "", content_type: "n3/turtle" }
      format.json {
        rgb_updated = (@bulb.brightness == params[:brightness])
        @bulb.update(bulb_params)

        huey_bulb = Huey::Bulb.find(1)
        unless huey_bulb.nil?
          if rgb_updated
            huey_bulb.update(rgb: @bulb.color, on: @bulb.on)
          else
            huey_bulb.update(bri: @bulb.brightness, on: @bulb.on)
          end


        end

        render json: @bulb
      }
    end
  end

  def connect
    respond_to do |format|
      format.turtle { render text: "", content_type: "n3/turtle" }
      format.json {
        begin
          Huey::Request.register
          render json: { status: true }
        rescue
          render json: { status: false }
        end
      }
    end
  end

  def trigger_observe
    respond_to do |format|
      format.turtle { render text: "", content_type: "n3/turtle" }
      format.json {
        begin
          CoAP::Client.new.post_by_uri('coap://141.83.151.196:5683/registry')
          render json: { status: 'Done' }
        rescue
          render json: { status: 'Done' }
        end
      }
    end
  end

  private

  def set_bulb
    @bulb = Bulb.first
  end

  def bulb_params
    params.require(:bulb).permit(:color, :on, :brightness, :id, :created_at, :updated_at)
  end

  def get_value_triple(s, o)
    if o.kind_of? String
      obj = "\"#{o}\"^^<http://www.w3.org/2001/XMLSchema#string>"
    else
      obj = o
    end
    "<#{GRP_PREFIX+s}> <#{PREFIX}hasValue> #{obj}"
  end
end
