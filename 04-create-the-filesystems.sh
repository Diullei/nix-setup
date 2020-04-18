# arguments:
#   boot partition eg. /dev/sda1

# -- Create a FAT32 filesystem on our boot partition
mkfs.vfat -n boot /dev/sda1

# -- Create an ext4 filesystem for our root partition
mkfs.ext4 -L nixos /dev/nixos-vg/root

# -- Tell our swap partition to be a swap
mkswap -L swap /dev/nixos-vg/swap

# -- Turn the swap on before install
swapon /dev/nixos-vg/swap