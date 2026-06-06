.ONESHELL:
.PHONY: install setup build clean launch control

all: install clean setup build

install:
	sudo apt-get update && sudo apt-get install -y curl gnupg2 lsb-release git vim fzf tmux
	sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $$(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
	curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.key | sudo apt-key add -
	sudo apt-get update && sudo apt-get install -y ros-noetic-desktop-full
	sudo apt-get install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
	wget -P /tmp/ https://github.com/zellij-org/zellij/releases/download/v0.44.3/zellij-x86_64-unknown-linux-musl.tar.gz
	tar -xzf /tmp/zellij-x86_64-unknown-linux-musl.tar.gz -C /tmp/
	sudo mv /tmp/zellij /usr/local/bin/

setup:
	mkdir -p $(HOME)/catkin_ws/src && cd $(HOME)/catkin_ws/src
	git clone -b noetic https://github.com/ROBOTIS-GIT/turtlebot3.git
	git clone -b noetic https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
	git clone -b noetic https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
	git clone -b noetic https://github.com/ROBOTIS-GIT/hls_lfcd_lds_driver.git
	echo "source /opt/ros/noetic/setup.bash" >> $(HOME)/.bashrc
	echo "source ~/catkin_ws/devel/setup.bash" >> $(HOME)/.bashrc
	echo "source ~/catkin_ws/roslaunch_picker.bash" >> $(HOME)/.bashrc
	echo "export TURTLEBOT3_MODEL=waffle_pi" >> $(HOME)/.bashrc
	echo "export DISABLE_ROS1_EOL_WARNINGS=1" >> $(HOME)/.bashrc
	echo "export LIBGL_ALWAYS_SOFTWARE=1" >> $(HOME)/.bashrc
	git init ~/catkin_ws

build:
	source /opt/ros/noetic/setup.bash
	sudo rosdep init
	rosdep update
	rosdep install --from-paths src -i -y
	@catkin_make

clean:
	@rm -rf build/ devel/ logs/ src/

launch:
	@./bin/rsl

control:
	roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
