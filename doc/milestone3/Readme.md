Um mit dem Coap-server zu sprechen das gem coap installieren und dann in der repl:

    response = CoAP::Client.new.get_by_uri('coap://[::1]:3000/.well-known/core')

für observe:

    CoAP::Client.new.observe_by_uri 'coap://[::1]:3000/bulbs', -> (s,m) {puts "#{s} and #{m}"}
