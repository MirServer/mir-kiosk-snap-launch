# Minimal setup for launching a Wayland snap 

Sprinkle this in your mir-kiosk-XXX snap/snapcraft.yaml

```yaml
  mir-kiosk-snap-launch:
    plugin: dump
    source: https://github.com/MirServer/mir-kiosk-snap-launch.git
    override-build:  $SNAPCRAFT_PART_BUILD/build-with-plugs.sh opengl wayland
    stage-packages:
      - inotify-tools
```

Where you put the plugs you need for your snap in the `override-build:` command.
_Note: Optional plugs should **not** be listed here: These plugs will be connected by the `/snap/mir-kiosk-XXX/current/bin/setup.sh` script and checked for by the `wayland-launch` script before trying to launch your app._

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
