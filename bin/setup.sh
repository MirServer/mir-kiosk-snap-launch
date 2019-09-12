#!/bin/sh

for PLUG in %PLUGS%; do sudo snap connect mir-kiosk-scummvm:${PLUG}; done
