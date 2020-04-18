# To mount existing partitions, you’ll need to decrypt the LVM partition and then activate its volume group.

# arguments 
#   swap partition eg. /dev/sda1
#   lvm partition eg. /dev/sda2

cryptsetup luksOpen $1 nixos-enc
lvscan
vgchange -ay

mount /dev/nixos-vg/root /mnt
mount $0 /mnt/boot
