{ config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    rnote
    libreoffice
    gimp
    davinci-resolve
    obs-studio
  ];
}