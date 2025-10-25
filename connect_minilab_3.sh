#!/bin/bash
# https://jereme.me/posts/raspberry-pi-midi-sound-module/

fluidsynth -is --audio-driver=alsa --gain 1 /usr/share/sounds/sf2/FluidR3_GM.sf2 &

sleep 5

aconnect 20:0 128:0