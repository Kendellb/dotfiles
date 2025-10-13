#!/usr/bin/env bash

# Icon to show in Polybar
icon=""

# Define your profiles and sinks
HDMI_PROFILE="HDMI"
LAPTOP_PROFILE="laptop"

HDMI_SINK="alsa_output.pci-0000_04_00.1.HiFi__HDMI1__sink"
LAPTOP_SINK="alsa_output.pci-0000_04_00.6.HiFi__Speaker__sink"

# Get currently active autorandr profile
current_profile=$(autorandr --current)

if [[ "$current_profile" == "$HDMI_PROFILE" ]]; then
    # Switch to laptop
    autorandr -l "$LAPTOP_PROFILE"
    pactl set-default-sink "$LAPTOP_SINK"
    echo "%{F#ffaa00}$icon%{F-}"  # Orange icon
else
    # Switch to HDMI
    autorandr -l "$HDMI_PROFILE"
    pactl set-default-sink "$HDMI_SINK"
    echo "%{F#00afff}$icon%{F-}"  # Blue icon
fi

