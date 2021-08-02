#!/bin/sh
set -e

snap_connect_harder() {
  # Note the available slot providers
  available_providers="$(snap interface "$1" | sed -e '1,/slots:/d')"

  # For wayland try some well known providers
  if [ "wayland" = "$1" ]; then
    for PROVIDER in ubuntu-frame mir-kiosk; do
       if echo "$available_providers" | grep --quiet "\- ${PROVIDER}"; then
         sudo snap connect "%SNAP%:$1" "${PROVIDER}:$1"
         return 0
       fi
    done
  fi

  echo "Warning: Failed to connect '$1'. Please connect manually, available providers are:\n$available_providers"
}

for PLUG in %PLUGS%; do
  sudo snap connect "%SNAP%:${PLUG}" 2> /dev/null || snap_connect_harder ${PLUG}
done
