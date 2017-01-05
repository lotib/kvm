#!/bin/bash
# as root

IMG=debian_boot.qcow2

qemu-img create -f qcow2 $IMG 2G
modprobe nbd max_part=16
qemu-nbd -c /dev/nbd0 $IMG
sfdisk /dev/nbd0 -D -uM  << EOF
,512,82
,,,*
;
EOF
mkswap /dev/nbd0p1
mkfs.ext4 /dev/nbd0p2
#qemu-nbd -d /dev/nbd0

echo "finished"
