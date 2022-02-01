#!/usr/bin/env bash

set -ex

docker run -it -v $(pwd):/root/config \
    zmkfirmware/zmk-build-arm:2.5 \
    bash /root/config/make-in-docker.sh

echo "Built firmware, now need sudo for flashing"
sudo echo "Got sudo"

sudo mount /dev/disk/by-id/usb-Adafruit_nRF_UF2_B49CD95A07C48BD5-0:0 /mnt/left-zen
sudo cp $(fzf -q firmwareleftuf2 -1) /mnt/left-zen/
sync
sudo umount /mnt/left-zen
echo "Flashed left side"

sudo mount /dev/disk/by-id/usb-Adafruit_nRF_UF2_FEE71EA3336A890B-0:0 /mnt/right-zen
sudo cp $(fzf -q firmwarerightuf2 -1) /mnt/right-zen
sync
sudo umount /mnt/right-zen
echo "Flashed right side"
