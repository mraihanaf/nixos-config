# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

{
  programs.dconf.profiles = {

    user.databases = [{
      settings = {
          "org/gnome/shell" = {
      disable-user-extensions = true;
      disabled-extensions = [ "native-window-placement@gnome-shell-extensions.gcampax.github.com" "windowgestures@extension.amarullz.com" "status-icons@gnome-shell-extensions.gcampax.github.com" "screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com" "system-monitor@gnome-shell-extensions.gcampax.github.com" "user-theme@gnome-shell-extensions.gcampax.github.com" "window-list@gnome-shell-extensions.gcampax.github.com" "windowsNavigator@gnome-shell-extensions.gcampax.github.com" ];
      enabled-extensions = [ "blur-my-shell@aunetx" "apps-menu@gnome-shell-extensions.gcampax.github.com" "drive-menu@gnome-shell-extensions.gcampax.github.com" "workspace-indicator@gnome-shell-extensions.gcampax.github.com" "places-menu@gnome-shell-extensions.gcampax.github.com" "auto-move-windows@gnome-shell-extensions.gcampax.github.com" "rectangle@acristoffers.me" ];
      last-selected-power-profile = "power-saver";
      welcome-dialog-last-shown-version = "47.2";
    };
      };
    }];

  };
}
