rm -f /mnt/etc/nixos/configuration1.nix
mv /mnt/etc/nixos/configuration.nix /mnt/etc/nixos/configuration1.nix
cp nix-setup/configuration.nix /mnt/etc/nixos/configuration.nix

cat /mnt/etc/nixos/configuration.nix