{ config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    wget
    git
    neofetch
    busybox
  ];
}