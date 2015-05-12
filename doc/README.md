# Dokumentation zur Inbetriebnahme des Photolink Projekts

## Raspberry aufsetzen

* WLAN
* hostname

## Abhängigkeiten installieren

Zum ausführen des Projekts müssen folgende Abhängigkeiten auf dem Raspberry installiert werden:

### wiringpi

[WiringPi](http://wiringpi.com) wird mit `git clone git://git.drogon.net/wiringPi` heruntergeladen
und mit `./build` im heruntergeladenen Vezeichnis global installiert.

### pi4j

[Pi4j](http://pi4j.com) wird auf dem Raspberry mit `curl -s get.pi4j.com | sudo bash` installiert.
Für die Entwicklung ist es zusätzlich auch im maven build process integriert und wird mit `mvn compile` heruntergeladen.

### Maven

Maven steht als alternative zum kompilieren und ausführen zur Verfügung.
Maven wird über `apt-get install mvn` installiert.
Hierbei kann unter umständen eine veraltete Java-version mitinstalliert werden.
Damit dies später keine Probleme bereitet muss zusätzlich per `sudo update-alternatives --config java`
die richtige Java version (1.8) ausgewählt werden.

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
