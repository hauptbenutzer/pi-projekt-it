require 'coap'

class CoapClient
  def initialize
    puts CoAP::Client.new.get('/test', 'iot.eclipse.org').payload

  end
end