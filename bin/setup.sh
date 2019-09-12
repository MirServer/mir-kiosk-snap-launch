#!/bin/sh

for PLUG in %PLUGS%; do sudo snap connect %SNAP%:${PLUG}; done
