{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-hyprland xdg-desktop-portal-gtk ];
  };

  environment.variables = {
    KITTY_ENABLE_WAYLAND = "1";
  };

  environment.systemPackages = with pkgs; [
	wofi
  fastfetch
	swayosd
	swww
	waybar
	dunst
	libnotify
	yazi
  ];
}
