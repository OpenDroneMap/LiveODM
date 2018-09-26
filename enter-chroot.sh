#!/bin/bash

sudo mount --bind /dev chroot/dev

sudo cp /etc/hosts chroot/etc/hosts
#sudo cp /etc/resolv.conf chroot/etc/resolv.conf
#sudo cp /etc/apt/sources.list chroot/etc/apt/sources.list

sudo mount none -t proc chroot/proc
sudo mount none -t sysfs chroot/sys
sudo mount none -t devpts chroot/dev/pts

# Allow python multiprocessing in chroot
sudo chmod 1777 /dev/shm/

sudo chroot chroot

sudo umount chroot/proc || sudo umount -lf /proc
sudo umount chroot/sys
sudo umount chroot/dev/pts
sudo umount chroot/dev

#sudo rm chroot/etc/resolv.conf
sudo rm chroot/etc/hosts
sudo rm chroot/home/odm/.bash_history 2>/dev/null
sudo rm chroot/root/.bash_history 2>/dev/null
sudo rm -fr chroot/tmp/*

