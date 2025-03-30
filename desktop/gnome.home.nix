{ config, pkgs, lib, ... }:
let
  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz;
in
{
  imports =
    [
      (import "${home-manager}/nixos")
    ];

  home-manager.backupFileExtension = "backup";  
  home-manager.users.rai = { pkgs, ... }: {
    home.username = "rai";
    home.homeDirectory = "/home/rai";
    home.packages = [ pkgs.atool pkgs.httpie ];
    programs.bash.enable = true;
    programs.home-manager.enable = true;
    
    programs.git = {
      enable = true;
      userName = "mraihanaf";
      userEmail = "mraihanaf0@gmail.com";
    };

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;

      zplug = {
        enable = true;
        plugins = [
          { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
        ];
      };

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "robbyrussell";
      };
    };

    programs.kitty = {
      enable = true;
      settings = {
        background_opacity = 0.5;
        hide_window_decorations = false;
        linux_display_server = "x11";
        font_family = "FiraCode";
      };
    };
    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "24.11";
  };
}
