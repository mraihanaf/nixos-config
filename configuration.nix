{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./platform/desktop-vivobook.nix
    ./desktop/gnome.nix
    ./desktop/gnome.home.nix
    ./desktop/gnome.dconf.nix
    ./module/basic.nix
    ./module/browser.nix
    ./module/develop.nix
    ./module/docker.nix
    ./module/wacom.nix
  ];

  # Bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  boot.plymouth.enable = true;
  boot.kernelParams = [ "quiet" "splash" ];
  boot.loader.timeout = 3;
  boot.initrd.verbose = false;

  # Networking
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";
  
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "24.11";
}