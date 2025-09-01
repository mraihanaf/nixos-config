{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./platform/desktop-vivobook.nix
    ./desktop/gnome.nix
    ./desktop/gnome.home.nix
    ./desktop/gnome.dconf.nix
    ./desktop/hyprland.nix
    ./module/basic.nix
    ./module/browser.nix
    ./module/develop.nix
    ./module/docker.nix
    ./module/wacom.nix
    ./module/daily-driver.nix
  ];

  # Bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  boot.plymouth.enable = true;
  boot.kernelParams = [ "quiet" "splash" "video=1920x1080" "kvm.enable_virt_at_load=0" ];
  boot.loader.timeout = 3;
  boot.initrd = {
    verbose = false;
    kernelModules = [ "i915" ];  # <- EARLY KMS MODULE
  };

  # Networking
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    extraHosts = "127.0.0.1 db.localtest.me";
  };

  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";
  
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.android_sdk.accept_license = true;
  system.stateVersion = "24.11";
}
