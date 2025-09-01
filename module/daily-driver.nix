{ config, pkgs, ...}:
{
  environment.interactiveShellInit = ''
  alias gs='git status'
  alias n='nvim'
  alias k='kubectl'
  alias t='terraform'
  alias d='docker'
  alias gp='sudo git push'
  alias rs="sudo nixos-rebuild switch"
  alias rb="sudo nixos-rebuild boot"
  fastfetch --logo ~/.config/Wallpapers/minjicrop.png
  '';
 
  environment.systemPackages = with pkgs; [
    rnote
    libreoffice
    gimp
    steam-devices-udev-rules
    steam
    bluetui
    ventoy-full
    ventoy-full-qt
    firefoxpwa
    distrobox
    woeusb
    spicetify-cli
    micro
    android-tools
    android-studio-tools
    android-studio-full
    androidenv.androidPkgs.ndk-bundle
    obs-studio
    pavucontrol
    pulseaudio
    avrdude
    pulseaudioFull
    gettext
    zip
    avrdude
    code-cursor
    anydesk
      (pkgs.wrapOBS {
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      droidcam
    ];
  })
  ];


  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';
  security.polkit.enable = true;

  services.tailscale.enable = true;
}
