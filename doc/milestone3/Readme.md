Raspberry Hue
=============

Mit dieser Applikation für den Raspberry PI ist es möglich, über eine COAP- so wie eine REST-Schnittstelle einen Philips Hue Leuchtkörper zu konfigurieren. Abgsehen vom manuellen Einstellen der Farb- und Helligkeitswerte, können für die in der RDF-Ontologie definierten Benutzeridentifikationsobjekte Präferenzen hinterlegt werden. So kann sich beispielsweise die Farbe der Lampe ändern, sobald ein Benutzer den Raum betritt, seine ID also durch andere Sensorik im zentralen Triple Store hinterlegt wird. 

Spezifikation der Schnittstellen
-------------

* [Triple Interface](Interface.md)
* [Webservice](Webserver.md)

Technische Dokumentation (WIP) 
------------------------

Um mit dem Coap-server zu sprechen, das gem coap installieren und dann in der repl:

    response = CoAP::Client.new.get_by_uri('coap://[::1]:3000/.well-known/core')

Für Observe:

    CoAP::Client.new.observe_by_uri 'coap://[::1]:3000/bulbs', -> (s,m) {puts "#{s} and #{m}"}
