#!/usr/bin/env ruby

docked = system("lsusb | grep Lenovo")
# system("xrandr --output eDP-1 --scale .7x.7")

if docked
  # Above
  system("xrandr -d :0.0 --output VIRTUAL1 --off --output eDP-1 --mode 2560x1440 --pos 0x1080 --rotate normal --output DP-1 --off --output DP-2-1 --off --output DP-2-2 --mode 2560x1080 --pos 0x0 --rotate normal --output DP-2-3 --off --output HDMI2 --off --output HDMI1 --off --output DP-2 --off")
  # Left
  # system("xrandr --output VIRTUAL1 --off --output eDP-1 --mode 2560x1440 --pos 0x592 --rotate normal --output DP-1 --off --output DP-2-1 --off --output DP-2-2 --mode 2560x1080 --pos 1792x0 --rotate normal --output DP-2-3 --off --output HDMI2 --off --output HDMI1 --off --output DP-2 --off")
else
  system("xrandr -d :0.0 --output VIRTUAL1 --off --output eDP-1 --mode 2560x1440 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2-1 --off --output DP-2-2 --off --output DP-2-3 --off --output HDMI2 --off --output HDMI1 --off --output DP-2 --off")
end

system("feh --randomize --bg-fill ~/.wallpaper/*")
