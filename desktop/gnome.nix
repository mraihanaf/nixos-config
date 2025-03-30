{config, pkgs, lib, ...}:
{
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.rectangle
    home-manager
    kitty
    zsh
  ];

  services.flatpak.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    gnome-console
  ];

  programs.gnome-terminal.enable = false;
  
  environment.shellAliases = {
    ssh = "kitty ssh";
  };

  programs.dconf.enable = true;
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  fonts.packages = with pkgs; [
    fira-code-nerdfont
    fira-code-symbols
  ];
}