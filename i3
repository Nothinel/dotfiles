#FROM HERE ON THIS IS WHAT I CONSIDER MY WHISHES FOR i3

# i3 config file (v4)

set $mod Mod4

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
font pango:monospace 13

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start a terminal
bindsym $mod+Return exec i3-sensible-terminal

# kill focused window
bindsym $mod+Shift+q kill

# start dmenu (a program launcher)
bindsym $mod+d exec dmenu_run

# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+z split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set $ws1 "1: terminal"
set $ws2 "2: firefox"
set $ws3 "3: work"
set $ws4 "4: thunderbird"
set $ws5 "5: jabref"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8: pidgin"
set $ws9 "9"
set $ws10 "10: htop"

# switch to workspace
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8
bindsym $mod+9 workspace $ws9
bindsym $mod+0 workspace $ws10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2
bindsym $mod+Shift+3 move container to workspace $ws3
bindsym $mod+Shift+4 move container to workspace $ws4
bindsym $mod+Shift+5 move container to workspace $ws5
bindsym $mod+Shift+6 move container to workspace $ws6
bindsym $mod+Shift+7 move container to workspace $ws7
bindsym $mod+Shift+8 move container to workspace $ws8
bindsym $mod+Shift+9 move container to workspace $ws9
bindsym $mod+Shift+0 move container to workspace $ws10

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym odiaeresis resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape or $mod+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}

bindsym $mod+r mode "resize"

set $bg-color #2f343f
set $inactive-bg-color #000000
set $text-color #40ff00
set $inactive-text-color #33cc00
set $urgent-bg-color #E53935

# window colors
# border background text indicator
client.focused  $bg-color   $bg-color   $text-color #00ff00
client.unfocused $iancative-bg-color $inactive-bg-color $inactive-text-color #00ff00
client.focused_inactive $iancative-bg-color $inactive-bg-color $inactive-text-color #00ff00
client.urgent $urgent-bg-color $urgent-bg-color $text-color #00ff00

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
        status_command i3status
}

#example of autorun commands for multiple screens displays monitors
exec xrandr --output HDMI2 --auto --right-of DP1
#autorun background stuff
exec nextcloud
exec dunst

exec i3-msg "workspace 1: terminal; exec i3-sensible-terminal"
exec i3-msg "workspace 2: firefox; exec firefox"
exec i3-msg "workspace 3: work; exec i3-sensible-terminal"
exec i3-msg "workspace 4: thunderbird; exec thunderbird"
#exec i3-msg "workspace 5: jabref; exec jabref"
exec i3-msg "workspace 8: pidgin; exec signal"
exec i3-msg "workspace 10: htop; exec urxvt -e htop"

#examples of sending the uneven workspaces to the left and the even nubered ones 
#to the right screen display monitor
#workspace $ws1 output DP1
#workspace $ws2 output HDMI2
#workspace $ws3 output DP1
#workspace $ws4 output HDMI2
#workspace $ws5 output DP1
#workspace $ws6 output HDMI2
#workspace $ws7 output DP1
#workspace $ws8 output HDMI2
#workspace $ws9 output DP1
#workspace $ws10 output HDMI2

#Example for locking the screen
#bindsym $mod+o exec i3lock --color=000000
