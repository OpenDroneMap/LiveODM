#!/bin/bash
set -eo pipefail

sudo apt update
sudo apt install -y squashfs-tools genisoimage xorriso isolinux

if [ ! -e ./chroot ]; then
	sudo cp ~/samba/opendronemap.iso .
	mkdir mnt
	sudo mount -o loop *.iso mnt
	mkdir image
	sudo rsync --exclude=/casper/filesystem.squashfs -a mnt/ image
	sudo unsquashfs mnt/casper/filesystem.squashfs
	sudo mv squashfs-root chroot	
	sudo umount mnt
	sudo rmdir mnt
fi
