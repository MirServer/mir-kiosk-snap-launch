#!/bin/sh

sed --in-place s'/%SNAP%/'$SNAPCRAFT_PROJECT_NAME'/' $SNAPCRAFT_PART_BUILD/bin/setup.sh
sed --in-place s'/%PLUGS%/'"$*"'/' $SNAPCRAFT_PART_BUILD/bin/setup.sh
snapcraftctl build
rm $SNAPCRAFT_PART_INSTALL/$(basename $0)