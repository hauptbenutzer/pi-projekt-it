# Aufsetzen des Observes

* Rails server starten mit `bundle exec rails server -p 5683 -b 0.0.0.0`
* Post auf `coap://141.83.151.196:5683/registry` (Am besten mit Cupper in Firefox, cmdline geht noch nicht, muss für Produktiveisnatz noch geändert werden)
* COAP Gem updaten im pfad `lib/core/coap/registry/content_formats.yml` die zeile `202: "n3/turtle"`
