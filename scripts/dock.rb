#!/usr/bin/env ruby

docked = system("lsusb | grep Lenovo")
# system("xrandr --output eDP1 --scale .7x.7")

if docked
  # Above
  system("xrandr --output VIRTUAL1 --off --output eDP1 --mode 2560x1440 --pos 0x1080 --rotate normal --output DP1 --off --output DP2-1 --off --output DP2-2 --mode 2560x1080 --pos 0x0 --rotate normal --output DP2-3 --off --output HDMI2 --off --output HDMI1 --off --output DP2 --off")
  # Left
  # system("xrandr --output VIRTUAL1 --off --output eDP1 --mode 2560x1440 --pos 0x592 --rotate normal --output DP1 --off --output DP2-1 --off --output DP2-2 --mode 2560x1080 --pos 1792x0 --rotate normal --output DP2-3 --off --output HDMI2 --off --output HDMI1 --off --output DP2 --off")
else
  system("xrandr --output VIRTUAL1 --off --output eDP1 --mode 2560x1440 --pos 0x0 --rotate normal --output DP1 --off --output DP2-1 --off --output DP2-2 --off --output DP2-3 --off --output HDMI2 --off --output HDMI1 --off --output DP2 --off")
end

system("feh --randomize --bg-fill ~/.wallpaper/*")
