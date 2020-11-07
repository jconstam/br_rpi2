#!/bin/bash

cp config_raspberrypi2 buildroot/.config
make -C buildroot menuconfig
