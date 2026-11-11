#!/usr/bin/env bash

dir="$HOME/nixos-config/dots/rofi"
theme='style'

rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
