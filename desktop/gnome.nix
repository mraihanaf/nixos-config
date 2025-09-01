{config, pkgs, lib, ...}:
{
  # services.xserver.displayManager.gdm = {
  #   autoLogin.user = "soni";
  # };

  services.xserver = {
    enable = true;
    # displayManager.sddm.enable = true;
    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = true;
    desktopManager.gnome.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.rectangle
    home-manager
    kitty
    zsh
    gnome-tweaks
  ];

  services.flatpak.enable = true;

  programs.gnome-terminal.enable = true;
  
  environment.shellAliases = {
    ssh = "kitten ssh";
  };

  programs.dconf.enable = true;
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    fira-code-symbols
    adwaita-fonts
  ];

  # Better font rendering 

  # This from https://www.reddit.com/r/linuxquestions/comments/owm43p/thicker_font_rendering_osxlike_is_it_possible/
  environment.variables = {
    FREETYPE_PROPERTIES = "truetype:interpreter-version=35 autofitter:no-stem-darkening=0";
  };

  # This one from chat gpt
  #fonts.fontconfig = {
  #  enable = true;
  #  antialias = true;  # Enable anti-aliasing
  #  hinting = {
  #    enable = true;   # Enable font hinting
  #    style  = "full"; # Set hinting style to 'full'
  #    autohint = true;   # Enable autohinting
  #  };
  #  subpixel = {
  #    rgba = "rgb";
  #  };
  # };
}
