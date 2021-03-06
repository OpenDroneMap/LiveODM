#!/bin/bash
set -eo pipefail

# Change this if needed
GOOGLE_DRIVE_FILE_ID=1ZSQRfhHmiEWnazlJRy6UEzKaYElDFv4l

sudo apt update
sudo apt install -y squashfs-tools genisoimage xorriso isolinux wget perl

if [ ! -e ./opendronemap.iso ]; then
	echo "Downloading opendronemap.iso..."
	./gdown.pl "https://drive.google.com/file/d/$GOOGLE_DRIVE_FILE_ID/edit" opendronemap.iso
fi

# Clean any previous failed execution.
set +e
mountpoint ./opendronemap.iso > /dev/null
if [ ${?} -eq 0 ] ; then
	sudo umount ./opendronemap.iso 2> /dev/null
fi
set -e
sudo rm -Rf mnt/ image/ squashfs-root/ 

if [ ! -e ./chroot ]; then
	mkdir mnt
	sudo mount -o loop *.iso mnt
	mkdir image
	sudo rsync --exclude=/casper/filesystem.squashfs -a mnt/ image
	sudo unsquashfs mnt/casper/filesystem.squashfs
	sudo mv squashfs-root chroot	
	sudo umount mnt
	sudo rmdir mnt
fi
