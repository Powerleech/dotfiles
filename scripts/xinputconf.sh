#!/bin/bash


tdriver=$(xinput list --name-only | grep -i "Synaptics")

if [[ "$tdriver" != "" ]]; then
    echo $tdriver
    driverId=$(xinput list --id-only "$tdriver")
    tapprop=$(xinput list-props $driverId | grep -i "Tap Action")
    if [[ "$tapprop" != "" ]]; then
        xinput set-prop $driverId "Synaptics Tap Action" 1, 1, 1, 1, 1, 1, 1
        xinput set-prop $driverId "Synaptics Palm Detection" 1
        xinput set-prop $driverId 327 1, 1
        echo $(xinput list-props $driverId | grep -i "Tap Action")
        echo $(xinput list-props $driverId | grep -i "Palm Detection")
        echo $(xinput list-props $driverId | grep -i "Two-Finger Scrolling")
        exit
    else
        echo error;
    fi
else
    echo not found;
fi

