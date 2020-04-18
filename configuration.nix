{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  environment.systemPackages = (with pkgs; [
    google-chrome
    git
    networkmanagerapplet
    nix-prefetch-scripts
    nix-repl
    vim
    wget
    curl
    which
    xscreensaver
  ]);

  time.timeZone = "Europe/Oslo";

  boot.initrd.luks.devices = [{
    name = "root";
    device = "/dev/sda2"; # created lvm partition
    preLVM = true;
  }];

  # boot.loader.grub.enable = true;
  # boot.loader.grub.version = 2;

  boot.loader.systemd-boot.enable = true;

  networking.useDHCP = false;
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp2s0.useDHCP = true;

  networking.networkmanager.enable = true;

  users.extraUsers.qfpl = {
    createHome = true;
    extraGroups = [ "wheel" "video" "audio" "disk" "networkmanager" ];
    group = "users";
    home = "/home/gomes";
    isNormalUser = true;
    uid = 1000;
  };

  system.stateVersion = "19.09";
}
