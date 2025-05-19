{ config, pkgs, ...}:
{
  services.xserver = {
    enable = true;
    # Configure keymap
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  services.printing.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.rai = {
    isNormalUser = true;
    description = "Raihan";
    extraGroups = ["networkmanager" "wheel" "docker" "dialout"];
    packages = with pkgs; [

    ];
  };

  # Power & Battery Management

  environment.systemPackages = with pkgs; [
    tlp
  ];

  services.power-profiles-daemon.enable = false;

  services.tlp = {
    enable = true;
    settings = {
      START_CHARGE_THRESH_BAT0 = 60;
      STOP_CHARGE_THRESH_BAT0 = 95;
      DEVICES_TO_DISABLE_ON_STARTUP="bluetooth";
    };
  };
}