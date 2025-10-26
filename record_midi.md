> Hi, how can I capture MIDI event from a MIDI device and save them on a MIDI file on Ubuntu?

The simplest command-line tool to capture MIDI events from a device and save them to a standard MIDI file (.mid) on Ubuntu is **`arecordmidi`**.

This utility is part of the **Advanced Linux Sound Architecture (ALSA)** utilities, which are usually pre-installed or easily accessible on Ubuntu.

Here's the step-by-step process:

-----

## 🎹 Step 1: Identify Your MIDI Device Port

You first need to find the specific ALSA client and port number of your MIDI device. You can list all available input ports using the `arecordmidi` command with the list option (`-l`):

```bash
arecordmidi -l
```

The output will look something like this:

```
Port Client name Port name
14:0 Midi Through Midi Through Port-0
20:0 My_MIDI_Controller My_MIDI_Controller MIDI 1
```

In this example, the port for your MIDI controller is **`20:0`**. Make a note of the correct port number for your device.

-----

## 🎙️ Step 2: Capture MIDI Events

Use the `arecordmidi` command with the port number and the desired output filename. The recording starts immediately and continues until you manually stop it.

**Syntax:**

```bash
arecordmidi -p client:port midifile.mid
```

**Example (using the port `20:0`):**

```bash
arecordmidi -p 20:0 my_recording.mid
```

  * **`-p 20:0`**: Specifies the input port from which to record.
  * **`my_recording.mid`**: The name of the MIDI file where the data will be saved.

Once you execute the command, start playing on your MIDI device.

-----

## 🛑 Step 3: Stop Recording

To stop the recording and save the file, simply press **Ctrl + C** in the terminal where `arecordmidi` is running.

The captured MIDI events will be saved into the specified `.mid` file.

-----

## 🎶 Alternative: Using a Digital Audio Workstation (DAW)

If you require features like **editing, sequencing, quantization**, or **visualizing** the MIDI data while recording, using a graphical application (DAW) is a much better choice.

Popular free and open-source DAWs for Ubuntu that handle MIDI recording include:

  * **Qtractor**: A light and efficient MIDI/Audio Multitrack Sequencer.
  * **Ardour**: A full-featured DAW suitable for professional use, supporting both MIDI and audio.
  * **Rosegarden**: A well-regarded MIDI sequencer and musical notation editor.

These applications offer a more robust environment for capturing and working with MIDI data.