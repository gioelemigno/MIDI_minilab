# MIDI minilab
## BUILD AND START CONTAINER
```bash
docker compose build
docker compose up
```

## CONNECT MIDI KEYBOARD
Connect to the running container with:
```bash
docker exec -it fluidsynth bash
```

Start fluidsynth with:
```bash
fluidsynth -a alsa -g 1 /usr/share/sounds/sf2/FluidR3_GM.sf2
```
```
root@0322ad79ad28:/app# fluidsynth -a alsa -g 1 /usr/share/sounds/sf2/FluidR3_GM.sf2
FluidSynth runtime version 2.3.1
Copyright (C) 2000-2022 Peter Hanappe and others.
Distributed under the LGPL license.
SoundFont(R) is a registered trademark of Creative Technology Ltd.

fluidsynth: warning: Failed to set thread to high priority
Type 'help' for help topics.

fluidsynth: warning: Failed to set thread to high priority
> 
```

Check the audio by playing a note with:
```bash
noteon 1 60 100
```

Now we need to connect `fluidsynth` with the MIDI keyboard.
Open another terminal inside the container:
```bash
docker exec -it fluidsynth bash
```

We first run the following command to get clients' ids:
```bash
aconnect -o
```
```bash
root@0322ad79ad28:/app# aconnect -o
client 14: 'Midi Through' [type=kernel]
    0 'Midi Through Port-0'
client 20: 'Minilab3' [type=kernel,card=1]
    0 'Minilab3 MIDI   '
    1 'Minilab3 DIN THRU'
    2 'Minilab3 MCU/HUI'
    3 'Minilab3 ALV    '
client 128: 'FLUID Synth (59)' [type=user,pid=59]
    0 'Synth input port (59:0)'
```

To connect:
```bash
aconnect 20:0 128:0
```

Now the MIDI keyboard should produce sound.

---

The previous procedure is automatized by:
```bash
docker exec -it fluidsynth bash
bash connect_minilab_3.sh
```

## REFERENCES
- https://jereme.me/posts/raspberry-pi-midi-sound-module/


