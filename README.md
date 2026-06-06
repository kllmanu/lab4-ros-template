# Lab 04b — Template

Es rentiert sich einen Terminal Multiplexer zu verwenden, wie zB `tmux` oder `screen`,
weil man doch oft mehrere Sachen gleichzeitig ausführen muss. Beides davon wird mit dem
Template im Container vorinstalliert.

Ralph verwendet in seinen Videos [zellij](https://zellij.dev/).

## Ubuntu installieren

### Windows 11 mit WSL2

1. Terminal als Administrator ausführen (mit Shift Rechtsklick -> Als Administrator ausführen)
2. `wsl --install -d Ubuntu-20.04` eingeben
3. Neuen Tab mit **Ubuntu 20.04** öffnen

### Linux (getestet unter Fedora 44)

1. [Distrobox](https://distrobox.it/) installieren
2. `distrobox create --image ubuntu:20.04 --name ros-noetic --home ~/.local/share/ros-home`
3. `distrobox enter ros-noetic`

## Projekt aufsetzen

Für das eigentliche Setup in Ubuntu 20.04 (man wird mehrmals nach dem Passwort gefragt):

```
cd
sudo apt update && sudo apt install unzip
wget https://github.com/kllmanu/lab4-ros-template/archive/refs/heads/main.zip -O repo.zip && unzip repo.zip && rm repo.zip
mv lab4-ros-template-main catkin_ws
cd ~/catkin_ws && make && bash
```

Was das Setup bereits für uns macht:

- die `~/catkin_ws/devel/setup.bash` über die `~/.bashrc` sourcen
- `TURTLEBOT3_MODEL=waffle_pi` über die `~/.bashrc` setzen
- `LIBGL_ALWAYS_SOFTWARE=1` über die `~/.bashrc` setzen
- das Package für Lab4 mit `catkin_create_pkg lab4` anlegen

## Ausführen

Zuerst `zellij` ausführen, wenn man möchte.

Der `roslaunch`er kann entweder per `Ctrl-l` oder mit `make launch`.
Wer hat schon Bock drauf das alles von Hand einzugeben? 😜

Mit `make control` lässt sich der Roboter steuern.
