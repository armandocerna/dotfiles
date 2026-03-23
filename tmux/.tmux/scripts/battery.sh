#!/bin/sh

if command -v pmset >/dev/null 2>&1; then
    BATT=$(pmset -g batt 2>/dev/null)
    echo "$BATT" | grep -q Battery || exit 0

    PCT=$(echo "$BATT" | grep -o '[0-9]\{1,3\}%')
    STATE=$(echo "$BATT" | grep -o 'charging\|discharging\|charged\|finishing charge\|AC attached')
    TIME=$(echo "$BATT" | grep -o '[0-9]\{1,2\}:[0-9]\{2\} remaining' | cut -d' ' -f1)

elif [ -d /sys/class/power_supply/BAT0 ]; then
    PCT="$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null)%"
    STATE=$(cat /sys/class/power_supply/BAT0/status 2>/dev/null | tr '[:upper:]' '[:lower:]')
    ENERGY_NOW=$(cat /sys/class/power_supply/BAT0/energy_now 2>/dev/null)
    POWER=$(cat /sys/class/power_supply/BAT0/power_now 2>/dev/null)
    if [ -n "$ENERGY_NOW" ] && [ -n "$POWER" ] && [ "$POWER" -gt 0 ]; then
        if echo "$STATE" | grep -q "charging"; then
            ENERGY_FULL=$(cat /sys/class/power_supply/BAT0/energy_full 2>/dev/null)
            REMAIN=$((ENERGY_FULL - ENERGY_NOW))
            HOURS=$((REMAIN / POWER))
            MINS=$(( (REMAIN % POWER) * 60 / POWER ))
        else
            HOURS=$((ENERGY_NOW / POWER))
            MINS=$(( (ENERGY_NOW % POWER) * 60 / POWER ))
        fi
        TIME=$(printf "%d:%02d" "$HOURS" "$MINS")
    fi
else
    exit 0
fi

[ -z "$PCT" ] && exit 0

case "$STATE" in
    charged|"finishing charge"|"AC attached")
        echo "⏻ Charged"
        ;;
    *)
        OUT="$PCT"
        [ -n "$TIME" ] && OUT="$OUT $TIME"
        echo "⏻ $OUT"
        ;;
esac
