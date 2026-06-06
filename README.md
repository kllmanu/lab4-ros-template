# Lab 04b — Template

4. Semester, Systemarchitekturen, FHV — Software & Information Engineering

## TLDR: Warum das alles?

Das Projekt aufsetzen, so wie es in der PDF beschrieben ist funktioniert nicht richtig. Einige Probleme auf die ich gestoßen bin:

- die Installation aus den Repositories von Ubuntu hat nicht funktioniert, man muss zuerst die Repositories von ROS1 hinzufügen
- die Packages die wir per `git clone` vom Source installieren sollen, müssen vom `-b noetic` Branch geklont werden
- es fehlte noch ein Package für den Lidar Sensor
- **generell sind die Anweisungen in der PDF sehr ungenau** und die Developer Experience (DX) ist eher mau

Die Lösung: Ein Template um mit Lab4 zu starten ohne dass man sich verkopfen muss. 🌈

Alternative: Schaut ins [Makefile](./Makefile) und führt die Anweisungen manuell aus.

## Ubuntu installieren

Je nachdem was ihr für Betriebssystem habt.

### für Windows 11 mit WSL2

1. Terminal als Administrator ausführen (mit Shift Rechtsklick -> Als Administrator ausführen)
2. `wsl --install -d Ubuntu-20.04` eingeben
3. Neuen Tab mit **Ubuntu 20.04** öffnen
4. Ubuntu Mono Font [installieren](https://fonts.google.com/specimen/Ubuntu+Mono) (optional)

<img width="801" height="742" alt="image" src="https://github.com/user-attachments/assets/10bd067d-1d5d-45fa-9175-ded3b8e588d8" />
<img width="1115" height="628" alt="image" src="https://github.com/user-attachments/assets/90af2a6c-ac3e-4001-b6fe-bd79ae76053a" />
<img width="1115" height="628" alt="image" src="https://github.com/user-attachments/assets/e2c82c47-1345-43ea-92e0-e22c1642fef1" />

### für Linux (getestet unter Fedora 44)

Nur wenn ihr ein GNU/Linux auf eurem Laptop installiert habt:

1. [Distrobox](https://distrobox.it/) installieren
2. `distrobox create --image ubuntu:20.04 --name ros-noetic --home ~/.local/share/ros-home`
3. `distrobox enter ros-noetic`

## Projekt aufsetzen

Für das eigentliche Setup in Ubuntu 20.04 (für diejenigen die Windows verwenden, ihr müsst einen neuen Tab im Terminal mit Ubuntu 20.04 aufmachen):

Man wird dabei ggf. mehrmals nach dem Passwort gefragt, das ihr bei der Installation von Ubuntu angegeben habt.

```
cd && sudo apt-get update -y && sudo apt-get -y install unzip make && \
wget https://github.com/kllmanu/lab4-ros-template/archive/refs/heads/main.zip -O repo.zip && unzip repo.zip && rm repo.zip && \
mv lab4-ros-template-main catkin_ws && \
cd ~/catkin_ws && make && source ~/.bashrc
```

Code kopieren und einfügen:

<img width="1115" height="628" alt="image" src="https://github.com/user-attachments/assets/f92fa912-22e9-48f7-ab52-31301f775d7f" />
<img width="1115" height="628" alt="image" src="https://github.com/user-attachments/assets/fb296a8c-2d60-418d-8160-bb4f346f43d3" />
<img width="1115" height="628" alt="image" src="https://github.com/user-attachments/assets/30b91c18-4526-4c36-800b-27b13f14523e" />

Nach der Installation, findet sich das Projekt dann unter:

<img width="1129" height="924" alt="image" src="https://github.com/user-attachments/assets/efab5c3f-5c92-493e-b40b-2c6df9ee68e5" />

Was das Setup bereits für uns macht:

- die `~/catkin_ws/devel/setup.bash` über die `~/.bashrc` sourcen
- `TURTLEBOT3_MODEL=waffle_pi` über die `~/.bashrc` setzen
- `LIBGL_ALWAYS_SOFTWARE=1` über die `~/.bashrc` setzen
- das Package für Lab4 mit `catkin_create_pkg lab4` anlegen

## Ausführen

Die Befehle müssen natürlich alle unter Ubuntu ausgeführt werden, sollte klar sein.

Es rentiert sich einen Terminal Multiplexer zu verwenden, wie zB `tmux` oder `screen`,
weil man doch oft mehrere Sachen gleichzeitig ausführen muss. Beides davon wird mit dem
Template im Container vorinstalliert.

Ralph verwendet in seinen Videos [zellij](https://zellij.dev/).

Zuerst `zellij` ausführen, wenn man möchte. Tutorials dazu findet man auf Youtube.

### roslaunch

Den `roslaunch`er müssen wir doch recht oft ausführen. Aber wer hat schon Bock drauf das alles von Hand einzugeben? 😜
Abhilfe schafft ein kleines Tool das in dieses Template integriert ist. Es lässt ich entweder per `Ctrl-l` oder mit
`make launch` starten.

[![asciicast](https://asciinema.org/a/1200780.svg)](https://asciinema.org/a/1200780)

Mit `make control` lässt sich der Roboter steuern.

## Verwendung von KI

Gemini oder Claude Code anweisen die einzelnen Schritte in `~/catkin_ws/src/lab4` umzusetzen.

Nach jedem Schritt ein Commit -> auf Sicht fahren und versuchen nachzuvollziehen was die KI macht. 
