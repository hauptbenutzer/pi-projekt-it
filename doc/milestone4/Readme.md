# Aufsetzen des Observes

* Rails server starten mit `bundle exec rails server -p 5683 -b 0.0.0.0`
* Post auf `coap://141.83.151.196:5683/registry` (Am besten mit Cupper in Firefox, cmdline geht noch nicht, muss für Produktiveisnatz noch geändert werden)
* COAP Gem updaten im pfad `lib/core/coap/registry/content_formats.yml` die zeile `202: "n3/turtle"`

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
