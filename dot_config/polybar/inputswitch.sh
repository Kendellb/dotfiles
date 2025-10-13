#!/usr/bin/env bash

# Icon to show in Polybar
icon=""

# Check if HDMI is connected
if xrandr | grep -q 'HDMI-[0-9] connected'; then
    # HDMI is connected
    autorandr -l HDMI
    pactl set-default-sink alsa_output.pci-0000_04_00.1.HiFi__HDMI1__sink
    echo "%{F#00afff}$icon%{F-}"  # Blue icon
else
    # HDMI not connected
    autorandr -l laptop
    pactl set-default-sink alsa_output.pci-0000_04_00.6.HiFi__Speaker__sink
    echo "%{F#ffaa00}$icon%{F-}"  # Orange icon
fi

