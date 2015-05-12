# Dokumentation zur Inbetriebnahme des Photolink Projekts

## Raspberry aufsetzen

* WLAN
* hostname

## Abhängigkeiten installieren

* wiringpi
* pi4j
* mvn

## Programm ausführen

### Berechnung der Widerstände

#### LED

Die LED hat eine Betriebsspannung von 2 bis 2,5 Volt und benötigt 25mA Stromstärke.
Der Raspberry gibt für eine logische 0 0V aus und für eine logische 1 3,3V.
Über den Widerstand muss eine Spannung von Urv anliegen.
    Urv=Uges - Ud = 3,3 - 2.0 ... 2,5 = 0,8 ... 1,3

Hieraus ergibt sich der nötige Widerstand Rv wie folgt:

    Rv=Urv/Irv = 0,8V...1,3V/25mA=32...52 Ohm 

Der nächstmögliche vorhandene Widerstand hat 100 Ohm und wird eignesetzt.

#### Photosensor

Der Raspberry liest an einem Input ab 2V eine logische 1, unter 0,8V eine logische 0.




* Schaltplan
* Kompilieren
* Ausführen
