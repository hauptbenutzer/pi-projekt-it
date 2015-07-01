class BulbsController < ApplicationController
  discoverable \
    default: { if: 'urn:things' },
    index:   { if: 'urn:index' },
    show: { if: 'urn:show' }

  def index
    render text: "http://itm.uni-luebeck.de/time1 http://itm.uni-luebeck.de/seconds 3536"
  end

  def show
    CoAP::Client.new.post_by_uri("coap://141.83.96.27:5683/registry")
  end
end
