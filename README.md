# Minimal setup for launching a Wayland snap 

Sprinkle this in your mir-kiosk-XXX snap/snapcraft.yaml

```yaml
  mir-kiosk-snap-launch:
    plugin: dump
    source: https://github.com/MirServer/mir-kiosk-snap-launch.git
    override-build:  $SNAPCRAFT_PART_BUILD/build-with-plugs.sh opengl pulseaudio wayland
```

Where you put the plugs you need for your snap in the `override-build:` command.

You use this to launch your app as follows:

```yaml
apps:
  daemon:
    command: run-daemon wayland-launch XXX
    daemon: simple
    ...

  mir-kiosk-XXX:
    command: wayland-launch XXX
    ...
```