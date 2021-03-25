#!/bin/bash

cp config_raspberrypi2 buildroot/.config
git clean -fdx
git -C buildroot/ checkout master
git -C buildroot/ pull
export FORCE_UNSAFE_CONFIGURE=1
make -C buildroot
