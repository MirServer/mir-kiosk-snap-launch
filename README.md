# Minimal setup for launching a Wayland snap 

Sprinkle this in your mir-kiosk-XXX snap/snapcraft.yaml

```yaml
  mir-kiosk-snap-launch:
    plugin: dump
    source: https://github.com/MirServer/mir-kiosk-snap-launch.git
    override-build: |
      sed --in-place s'/%PLUGS%/opengl pulseaudio wayland/' $SNAPCRAFT_PART_BUILD/bin/setup.sh
      snapcraftctl build
```

Where you put the plugs you need for your snap in the `sed` command.

You use this to launch your app as follows:

```yaml
apps:
  daemon:
    command: run-daemon wayland-launch XXX
    daemon: simple
    ...

  mir-kiosk-scummvm:
    command: wayland-launch XXX
    ...
```