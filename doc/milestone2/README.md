# Idee

Mit Milestone 2 soll es ermglicht werden, eine Philips Hue über den Raspberry
zu steuern und diesen an den Smart Room zu koppeln

# Einrichten

Der Raspberry und die Hue Bridge müssen im selben Netzwerk sein.
Hierfür kann die bridge einfach per Ethernet an den Raspberry angeschlossen werden.
Auf dem Raspberry wird mithilfe des Gems [https://github.com/Veraticus/huey](Huey)
mit der Bridge kommuniziert.
Hierfür muss die ip Adresse der Bridge angegeben werden (wmgl. 10.0.1.102) gesetzt werden:

    Huey.configure do |d|
      d.hue_ip = '10.0.1.102'
    end

Anschließend kann wie auf Github beschrieben mit der Lampe kommuniziert werden.

## Raspberry mit Bridge koppeln

http://www.glennklockwood.com/sa/rpi-wifi-bridge.php
