class BulbsController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :set_bulb, only: [:get, :update]

  discoverable \
    get: { obs: :true }

  GRP_PREFIX = "http://grp08.pit.itm.uni-luebeck.de/"
  PREFIX = "http://pit.itm.uni-luebeck.de/"


  def get
    respond_to do |format|
      format.json {
        render json: @bulb
      }
      format.turtle {
        response = [
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
