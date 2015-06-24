Raspberry Hue Triple Interface
======

Der Aktor vom Typ `sva:hue-bulb` kann über folgende Prädikate angesprochen werden.

Prädikate
-----

Folgend gilt `@prefix sva-hue: <http://itm.uni-luebeck.de/sva/hue#>`

* `sva-hue:hasColor` {rgb-wert}

  Beschreibt die aktuelle Farbe der Lampe.

  Anzugeben als sechsstellige Hexadezimalzahl ohne führende Raute.
  Sättigung und Farbton werden automatisch aus dem Wert berechnet und
  entsprechend an der Lampe eingestellt.

* `sva-hue:hasBrightness` {int}

  Verändert die Helligkeit der Lampe unabhängig vom Farbwert.

  Der Wertebereich liegt zwischen `0` und `254`, wobei zu beachten ist, dass
  eine `0` als Wert die Lampe *nicht* ausschaltet.

* `sva-hue:isOn` {boolean}

  Beschreibt den aktuellen Zustand der Lampe. `true` schaltet die Lampe ein,
  `false` schaltet sie aus. 
