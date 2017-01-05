#!/bin/bash
# as root

mount /dev/nbd0p2 /mnt/

debootstrap --variant=minbase jessie /mnt  http://ftp.fr.debian.org/debian

cp custom.sh /mnt

mount --bind /dev/ /mnt/dev
LANG=C chroot /mnt/ /custom.sh

grub-install /dev/nbd0 --root-directory=/mnt --modules="biosdisk part_msdos"

sed -i s/nbd0p2/sda2/g /mnt/boot/grub/menu.lst
sed -i s/nbd0p2/sda2/g /mnt/boot/grub/grub.cfg


#umount /mnt/dev
umount /mnt
qemu-nbd -d /dev/nbd0

