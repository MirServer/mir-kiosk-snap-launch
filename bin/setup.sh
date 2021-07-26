#!/bin/sh
set -e

for PLUG in %PLUGS%; do sudo snap connect %SNAP%:${PLUG}; done
