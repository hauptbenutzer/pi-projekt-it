package de.uni_luebeck.itm.sva08;


import de.uniluebeck.itm.ncoap.application.client.CoapClientApplication;
import de.uniluebeck.itm.ncoap.message.CoapRequest;
import de.uniluebeck.itm.ncoap.message.MessageCode;
import de.uniluebeck.itm.ncoap.message.MessageType;

import java.net.*;

public class Read extends CoapClientApplication {


    public static void main(String[] args) throws URISyntaxException, UnknownHostException {
        URI webservice = new URI("coap", null, "vs0.inf.ethz.ch", 5683, "/.well-known/core", null, null);
        System.out.println(webservice);

        CoapRequest coapRequest = new CoapRequest(MessageType.Name.NON, MessageCode.Name.GET, webservice, false);

        this.sendCoapRequest(coapRequest);

    }

}