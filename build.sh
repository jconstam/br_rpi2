#!/bin/bash

cp config_raspberrypi2 buildroot/.config
export FORCE_UNSAFE_CONFIGURE=1
make -C buildroot
