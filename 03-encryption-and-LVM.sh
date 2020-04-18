# arguments 
#   lvm partition eg. /dev/sda2
#   amount of RAM on this machine eg. 32

# -- You will be asked to enter your passphrase - DO NOT FORGET THIS
cryptsetup luksFormat /dev/sda2

# -- Decrypt the encrypted partition and call it nixos-enc. The decrypted partition
# -- will get mounted at /dev/mapper/nixos-enc
cryptsetup luksOpen /dev/sda2 nixos-enc
    
# -- Create the LVM physical volume using nixos-enc
pvcreate /dev/mapper/nixos-enc 

# -- Create a volume group that will contain our root and swap partitions
vgcreate nixos-vg /dev/mapper/nixos-enc

# -- Create a swap partition that is 16G in size - the amount of RAM on this machine
# -- Volume is labeled "swap"'
lvcreate -L 32G -n swap nixos-vg

# -- Create a logical volume for our root filesystem from all remaining free space.
# -- Volume is labeled "root"
lvcreate -l 100%FREE -n root nixos-vg