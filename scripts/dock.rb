#!/usr/bin/env ruby

docked = system("lsusb | grep Lenovo")
# system("xrandr --output eDP-1 --scale .7x.7")

if docked
  # Two Display + Laptop
  # system("xrandr --output DP-2-1 --mode 2560x1440 --pos 0x0 --rotate normal --output DP-2-2 --mode 2560x1080 --pos 2560x360 --rotate normal --output DP-2-3 --off --output eDP-1 --primary --mode 2560x1440 --pos 0x1440 --rotate normal --output HDMI-2 --off --output HDMI-1 --off --output DP-2 --off --output DP-1 --off")
  # Two Display Laptop closed
  # system("xrandr --output DP-2-1 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output DP-2-2 --mode 2560x1080 --pos 2560x360 --rotate normal --output DP-2-3 --off --output eDP-1 --off --output HDMI-2 --off --output HDMI-1 --off --output DP-2 --off --output DP-1 --off")
  # Above
  system("xrandr -d :0.0 --output VIRTUAL1 --off --output eDP-1 --mode 2560x1440 --pos 0x1080 --rotate normal --output DP-1 --off --output DP-2-1 --off --output DP-2-2 --mode 2560x1080 --pos 0x0 --rotate normal --output DP-2-3 --off --output HDMI2 --off --output HDMI1 --off --output DP-2 --off")
  # Left
  # system("xrandr --output VIRTUAL1 --off --output eDP-1 --mode 2560x1440 --pos 0x592 --rotate normal --output DP-1 --off --output DP-2-1 --off --output DP-2-2 --mode 2560x1080 --pos 1792x0 --rotate normal --output DP-2-3 --off --output HDMI2 --off --output HDMI1 --off --output DP-2 --off")
else
  system("xrandr -d :0.0 --output VIRTUAL1 --off --output eDP-1 --mode 2560x1440 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2-1 --off --output DP-2-2 --off --output DP-2-3 --off --output HDMI2 --off --output HDMI1 --off --output DP-2 --off")
end

system("pkill -f compton")
system("compton -b --backend=glx")
system("feh --randomize --bg-fill ~/.wallpaper/*")
# system("wal -i ~/.wallpaper -t")

# system("pkill -USR2 compton")
