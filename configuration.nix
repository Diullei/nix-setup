{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  environment.systemPackages = (with pkgs; [
    firefox
    git
    networkmanagerapplet
    nix-prefetch-scripts
    vim
    wget
    curl
    which
    xscreensaver
    terminator
  ]);

  time.timeZone = "Europe/Oslo";

  boot.initrd.luks.devices = [{
    name = "root";
    device = "/dev/sda2"; # created lvm partition
    preLVM = true;
  }];

  # boot.loader.grub.enable = true;
  # boot.loader.grub.version = 2;
  # boot.loader.grub.devices = [ "nodev" ];

  boot.loader.systemd-boot.enable = true;

  networking.useDHCP = false;
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp2s0.useDHCP = true;

  networking.networkmanager.enable = true;

  services = {
    xserver = {
      libinput.naturalScrolling = true;
      libinput.middleEmulation = true;
      libinput.tapping = true;
      libinput.enable = true;

      enable = true;
      displayManager = {
        sddm = {
          enable = true;
          # autoLogin = false;
          # theme = slim-theme;
          # defaultUser = "gomes";
        };
      };

      # displayManager.sddm.enable = true;

      desktopManager = {
         gnome3.enable = true;
         plasma5.enable = true;
      };

      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        extraPackages = with pkgs; [
          dmenu
          i3status
          i3lock
          # i3blocks
          rofi
        ];
      };
    };
  };

  users.extraUsers.gomes = {
    createHome = true;
    extraGroups = [ "wheel" "video" "audio" "disk" "networkmanager" ];
    group = "users";
    home = "/home/gomes";
    isNormalUser = true;
    uid = 1000;
  };

  system.stateVersion = "19.09";
}
