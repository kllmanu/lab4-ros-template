roslaunch_picker() {
    # 1. Source environments just in case
    source /opt/ros/noetic/setup.bash 2>/dev/null
    source ~/catkin_ws/devel/setup.bash 2>/dev/null

    # 2. Select the ROS package
    local package
    package=$(rospack list-names | fzf --prompt="Select ROS Package > ")
    [ -z "$package" ] && return 0

    # 3. Find all launch files inside that package
    local pkg_path
    pkg_path=$(rospack find "$package")
    
    local chosen_path
    chosen_path=$(find "$pkg_path" -name "*.launch" -type f 2>/dev/null | fzf \
        --delimiter="/" \
        --with-nth=-1 \
        --prompt="$package > ")
    [ -z "$chosen_path" ] && return 0

    local launch_file
    launch_file=$(basename "$chosen_path")

    # 4. Construct the final command
    local cmd="roslaunch $package $launch_file"

    # 5. THE MAGIC: Inject the command into the Bash command line buffer
    # This puts the text on your prompt without executing it yet.
    READLINE_LINE="$cmd"
    READLINE_POINT=${#cmd}
}

# Bind this function to a keyboard shortcut, for example: Ctrl+G
# (You can change "\C-g" to whatever key combo you prefer)
bind -x '"\C-l": roslaunch_picker'
