#!/bin/sh
set -e

snap_connect() {
  available_providers="$(snap interface $2 | sed -e '1,/slots:/d')"
  for PROVIDER in snapd ubuntu-frame mir-kiosk; do
     if echo "$available_providers" | grep --quiet "\- ${PROVIDER}"; then
       sudo snap connect "$1:$2" "${PROVIDER}:$2"
       return 0
     fi
  done
  echo "Warning: Failed to connect '$2'. Please connect manually, available providers are:\n$available_providers"
}

for PLUG in %PLUGS%; do snap_connect %SNAP% ${PLUG}; done
