#!/bin/sh

mount -t proc none /proc
mount -t sysfs none /sys
apt-get install linux-image-amd64 grub
grub-install /dev/nbd0
update-grub
passwd root
umount /proc/ /sys/ /dev/
exit

