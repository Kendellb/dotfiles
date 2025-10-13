#!/bin/bash

# Check if HDMI is connected using xrandr
if xrandr | grep -q 'HDMI-[0-9] connected'; then
    # HDMI is connected
    autorandr -l HDMI
    pactl set-default-sink alsa_output.pci-0000_04_00.1.HiFi__HDMI1__sink
    echo " HDMI"
else
    # HDMI is not connected
    autorandr -l laptop
    pactl set-default-sink alsa_output.pci-0000_04_00.6.HiFi__Speaker__sink
    echo " Laptop"
fi

