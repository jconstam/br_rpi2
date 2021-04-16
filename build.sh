#!/bin/bash

git -C buildroot/ clean -fdx
cp config_raspberrypi2 buildroot/.config
git -C buildroot/ checkout master
git -C buildroot/ pull
export FORCE_UNSAFE_CONFIGURE=1
make -C buildroot
