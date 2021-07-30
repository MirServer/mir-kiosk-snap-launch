#!/bin/sh
set -e

snap_connect() {
  if snap connections | grep --quiet "[[:space:]]:$2"; then
    # Where there's a system slot use it
    sudo snap connect "$1:$2"
  else
    # Otherwise note the available slot providers
    available_providers="$(snap interface "$2" | sed -e '1,/slots:/d')"

    # For wayland try some well known providers
    if [ "wayland" = "$2" ]; then
      for PROVIDER in ubuntu-frame mir-kiosk; do
         if echo "$available_providers" | grep --quiet "\- ${PROVIDER}"; then
           sudo snap connect "$1:$2" "${PROVIDER}:$2"
           return 0
         fi
      done
    fi

    echo "Warning: Failed to connect '$2'. Please connect manually, available providers are:\n$available_providers"
  fi
}

for PLUG in %PLUGS%; do
  if ! snap connections | grep --quiet "%SNAP%:${PLUG}"; then
    snap_connect %SNAP% ${PLUG}
  fi
done
