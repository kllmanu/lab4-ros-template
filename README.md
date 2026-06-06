# Lab 04b — Template

Oben rechts "Use this template" -> "Create a new repository"

Es rentiert sich einen Terminal Multiplexer zu verwenden, wie zB `tmux` oder `screen`,
weil man doch oft mehrere Sachen gleichzeitig ausführen muss.

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

Für das eigentliche Setup in Ubuntu 20.04:

```
cd
wget https://github.com/kllmanu/lab4-ros-template/archive/refs/heads/main.zip -O repo.zip && unzip repo.zip && rm repo.zip
mv lab4-ros-template-main catkin_ws
cd ~/catkin_ws && make
```

## Ausführen

### Launch

Mit `make launch` einen bequemen Wrapper für `roslaunch` ausführen. Per `fzf`
wird zuerst nach dem Package gefragt (in der Regel `turtlebot3_gazebo`)
und dann das gewünschte Launch file ausgewählt.

### Control

Mit `make control` den Bot steuern.
