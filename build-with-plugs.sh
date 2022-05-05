#!/bin/sh
set -e

sed --in-place s'/%PLUGS%/'"$*"'/g' $SNAPCRAFT_PART_BUILD/bin/setup.sh
sed --in-place s'/%PLUGS%/'"$*"'/g' $SNAPCRAFT_PART_BUILD/bin/wayland-launch

snapcraftctl build
rm $SNAPCRAFT_PART_INSTALL/$(basename $0)