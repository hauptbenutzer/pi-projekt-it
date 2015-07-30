class BulbsController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :set_bulb
  discoverable \
    get: { obs: :true }

  GRP_PREFIX = "http://grp08.pit.itm.uni-luebeck.de/"
  PREFIX = "http://pit.itm.uni-luebeck.de/"



  def get
    response = [
      get_value_triple("isOn", @bulb.on), 
      get_value_triple("hasColors", @bulb.color),
      get_value_triple("hasBrightness", @bulb.brightness)].join(". ")
    render text: response, content_type: "n3/turtle"
  end

  def update
    respond_to do |format|
      @bulb.update(bulb_params)
      format.json { render json: @bulb }
    end
    @bulb.update(bulb_params)
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
