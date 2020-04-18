# To mount existing partitions, you’ll need to decrypt the LVM partition and then activate its volume group.

# arguments 
#   lvm partition eg. /dev/sda2

cryptsetup luksOpen $0 nixos-enc
lvscan
vgchange -ay

mount /dev/nixos-vg/root /mnt
mkdir /mnt/boot
mount $0 /mnt/boot
nixos-generate-config --root /mnt