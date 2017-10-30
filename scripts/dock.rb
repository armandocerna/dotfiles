#!/usr/bin/env ruby

docked = system("lsusb | grep Lenovo")
system("xrandr --output eDP1 --scale 1x1")

if docked
  # Above
  system("xrandr -d :0.0 --output eDP1 --mode 1920x1080 --pos 0x1080 --rotate normal --output DP2-2 --mode 2560x1080 --pos 0x0 --rotate normal")
else
  system("xrandr -d :0.0 --output VIRTUAL1 --off --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output DP2-1 --off --output DP2-2 --off --output DP2-3 --off --output HDMI2 --off --output HDMI1 --off --output DP2 --off")
end

system("pkill -f compton")
system("compton -b --backend=glx")
# system("compton -b")
system("feh --randomize --bg-fill ~/.wallpaper/*")
# system("wal -i ~/.wallpaper -t")

# system("pkill -USR2 compton")
