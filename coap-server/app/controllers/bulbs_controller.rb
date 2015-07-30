class BulbsController < ApplicationController
  before_action :set_bulb
  discoverable \
    default: { obs: :true }

  GRP_PREFIX = "http://grp08.pit.itm.uni-luebeck.de/"
  PREFIX = "http://pit.itm.uni-luebeck.de/"

  def on
    render text: get_value_triple("isOn", @bulb.on), content_type: "n3/turtle"
  end

  def color
    render text: get_value_triple("hasColors", @bulb.color), content_type: "n3/turtle"
  end

  def brightness
    render text: get_value_triple("hasBrightness", @bulb.brightness), content_type: "n3/turtle"
  end

  private

  def set_bulb
    @bulb = Bulb.first
  end

  def get_value_triple(s, o)
    if o.kind_of? string
      obj = "\"#{o}\"^^<http://www.w3.org/2001/XMLSchema#string>"
    else
      obj = o
    end
    "<#{GRP_PREFIX+s}> <#{PREFIX}hasValue> #{obj}"
  end
end
