#!/usr/bin/env bash

set -ex

cd /root/config

west init -l config || true
west update
west zephyr-export

west build --pristine -s zmk/app -b corne-ish_zen_left \
    -- -DZMK_CONFIG="/root/config/config"
cp build/zephyr/zmk.uf2 firmware/corneish_zen_left.uf2

west build --pristine -s zmk/app -b corne-ish_zen_right \
    -- -DZMK_CONFIG="/root/config/config"
cp build/zephyr/zmk.uf2 firmware/corneish_zen_right.uf2
