#!/bin/bash

set -eo pipefail

if [ -e image/casper/filesystem.squashfs ]; then
	sudo rm image/casper/filesystem.squashfs
fi

sudo chroot chroot dpkg-query -W --showformat='${Package} ${Version}\n' | sudo tee image/casper/filesystem.manifest
sudo cp -v image/casper/filesystem.manifest image/casper/filesystem.manifest-desktop
REMOVE='ubiquity casper'
for i in $REMOVE 
do
        sudo sed -i "/${i}/d" image/casper/filesystem.manifest-desktop
done

sudo mksquashfs chroot image/casper/filesystem.squashfs 
sudo bash -c "printf $(sudo du -sx --block-size=1 chroot | cut -f1) > image/casper/filesystem.size"

sudo bash -c "(cd image && find . -type f -print0 | xargs -0 md5sum | grep -v isolinux/boot.cat | sudo tee md5sum.txt)"

cd image

#sudo mkisofs -D -r -V OpenDroneMap -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o ../opendronemap.iso .
sudo xorriso -as mkisofs -isohybrid-mbr /usr/lib/ISOLINUX/isohdpfx.bin -c isolinux/boot.cat -b isolinux/isolinux.bin -no-emul-boot -boot-load-size 4 -boot-info-table -eltorito-alt-boot -e boot/grub/efi.img -no-emul-boot -isohybrid-gpt-basdat -o ../opendronemap.iso .

cd ..

