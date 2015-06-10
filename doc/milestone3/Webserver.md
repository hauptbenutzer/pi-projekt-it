Webservice
=========

Auf dem Raspberry Pi wird für eine einfache Kommunikation zwischen Benutzer bzw.
Client, Triplestore und der Philips Hue ein Webserver installiert. Dieser wird
neben Endpunkten zum Abfragen und Setzen der Leuchteigenschaften der Philips
Hue, auch Endpunkte für das Setzen und Abfragen von Benutzerpräferenzen zur
Verfügung stellen. Durch ein stabiles Interface können Clients unabhängig von CoAP und
der zugrunde liegenden Ontologie programmiert werden.

# Endpunkte #

Der Webserver reagiert auf folgende Operationen:

* `GET` `/users/{{id}}`
  Liefert präferierten Helligkeits- und Farbwert des Users mit dem
  Identifikationsmerkmal `{{id}}` zurück.
  (Entspricht `SELECT ?prefBright ?prefLightColor WHERE { ?x  hasId {{id}}}`)
  (z.B. `{"brightness": 50, "color": "FEFEFE"}`)

* `PUT` `/users/{{id}}`
  Erwartet im Body ein JSON-Objekt mit Eigenschaften `brightness` und
  `color`.
  (z.B. `{"brightness": 128, "color": "FFFFFF"}`)

* `GET` `/status`
  Liefert aktuellen Helligkeits- und Farbwert der Hue zurück.
  (Entspricht `SELECT ?sva-hue:hasColor ?sva-hue:hasBrightness ?sva-hue:isOn`)
  (z.B. `{"isOn": true, "brightness": 36, "color": "555555"}`)

* `PUT` `/status`
  Erwartet im Body ein JSON-Objekt mit mindestens einer Eigenschaft aus `color`, `brightness` und
  `isOn`.
  (z.B. `{"isOn": false}` zum Ausschalten)


# Clients #

Als Client wird zunächst eine einfache Website entwickelt, die es einem Benutzer
erlaubt seinen präferierten Helligkeits- und Farbwert für die Hue auszuwählen.
Zukünftig ist denkbar, dass ein stationärer Client im Living Lab installiert
wird, bspw. ein fest installiertes Tablet oder Touch-Screen (mit Verbindung zum
Raspberry Pi). Letzteres würde auch noch offene Fragen bezüglich der Authentifizierung im
System klären.
