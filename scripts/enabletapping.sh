#!/bin/bash


tdriver=$(xinput list --name-only | grep -i "Synaptics")

if [[ "$tdriver" != "" ]]; then
    echo $tdriver
    driverId=$(xinput list --id-only "$tdriver")
    tapprop=$(xinput list-props $driverId | grep -i "Tap Action")
    if [[ "$tapprop" != "" ]]; then
        xinput set-prop $driverId "Synaptics Tap Action" 1, 1, 1, 1, 1, 1, 1
        echo $(xinput list-props $driverId | grep -i "Tap Action")
        exit
    else
        echo error;
    fi
else
    echo not found;
fi

