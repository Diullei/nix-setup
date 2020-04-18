# arguments:
#   boot partition eg. /dev/sda1

mount /dev/nixos-vg/root /mnt
mkdir /mnt/boot
mount $0 /mnt/boot
nixos-generate-config --root /mnt