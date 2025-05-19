{ config, pkgs, ...}:
{
  
  environment.interactiveShellInit = ''
  alias gs='git status'
  alias n='nvim'
  alias k='kubectl'
  '';

  environment.variables = {
    "TMPDIR" = "$(echo $HOME)/.terraform_tmp";
  };

  environment.systemPackages = with pkgs; [
    rnote
    libreoffice
    gimp
    davinci-resolve
    obs-studio
    pavucontrol
    pulseaudio
    android-tools
    pulseaudioFull
    terraform
    kubernetes
    minikube
    envsubst
    awscli2
    zip
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
