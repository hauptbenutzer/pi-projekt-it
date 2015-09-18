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
      format.json {
        @bulb.update(bulb_params)

        bulb = Huey::Bulb.find(1)
        bulb.update(bri: @bulb.brightness, rgb: @bulb.color, on: @bulb.on)

        render json: @bulb
      }
    end
  end

  def connect
    Huey::Request.register
    render text: 'connected succesfully'
  end

  private

  def set_bulb
    @bulb = Bulb.first
  end

  def bulb_params
    params.require(:bulb).permit(:color, :on, :brightness)
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
