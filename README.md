# Minimal setup for launching a Wayland snap 

Sprinkle this in your mir-kiosk-XXX snap/snapcraft.yaml

```yaml
  mir-kiosk-snap-launch:
    plugin: dump
    source: https://github.com/MirServer/mir-kiosk-snap-launch.git
    override-build:  $SNAPCRAFT_PART_BUILD/build-with-plugs.sh opengl pulseaudio wayland
    stage-packages:
      - inotify-tools
```

Where you put the plugs you need for your snap in the `override-build:` command.

You use this to launch your app as follows:

```yaml
apps:
  daemon:
    daemon: simple
    restart-condition: always
    command-chain:
      - bin/run-daemon
      - bin/wayland-launch
    command: XXX
    ...

  mir-kiosk-XXX:
    command-chain:
      - bin/wayland-launch
    command: XXX
```