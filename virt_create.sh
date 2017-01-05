#!/bin/bash

virt-install \
    --connect qemu:///system \
    --virt-type kvm \
    --name testkvm \
    --ram 512 \
    --disk path=/var/lib/libvirt/images/demo.img,size=4,format=qcow2 \
    --graphics vnc \
    --cdrom  /tmp/debian-8.6.0-amd64-netinst.iso  \
    --network bridge=br0
    --os-type linux
    --os-variant debianjessie


