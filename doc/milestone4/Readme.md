# Erstes Aufsetzen des Servers

* Im coap-server Ordner `bin/setup` ausführen, das sollte alles erledigen

# Server starten

* Addresse der Huey Bridge muss in der Model Klasse bulb.rb in der Konstanten `IP_ADDRESS` eingetragen sein
* Server starten mit `foreman start`
* Rails App mit Bridge verbinden:
	* Zuerst der Knopf auf der Bridge drücken
	* anschließend ein `get` auf `$r-pi-ip:3000/connect` machen

# Observer starten
* Post auf `coap://141.83.151.196:5683/registry`:
	* `bundle exec rails console` 
	* `CoAP::Client.new.post_by_uri('coap://141.83.151.196:5683/registry')`


# SPARQL Queries

	PREFIX pit: <http://pit.itm.uni-luebeck.de/>
	SELECT ?user ?brightness ?color
	WHERE {
		?user pit:hasID 123 ;
			  pit:prefBright ?brightness ;
			  pit:prefLightColor ?color .
	}


	PREFIX pit: <http://pit.itm.uni-luebeck.de/>
	PREFIX hue: <http://itm.uni-luebeck.de/sva/hue#>

	SELECT ?value ?unit
	WHERE {
		?actor pit:isType "HUE" ;
			   pit:hasStatus ?status .
		?status pit:hasValue ?value ;
				pit:hasScaleUnit ?unit ;
	}
