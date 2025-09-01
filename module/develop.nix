{ config, pkgs, ...}:
{
  
  environment.variables = {
    "TMPDIR" = "$(echo $HOME)/.terraform_tmp";
  };


  environment.systemPackages = with pkgs; [
    virtualbox
    ansible
    vscode
    neovim
    vimPlugins.vim-wayland-clipboard
    wl-clipboard
    platformio
    platformio-core
    ripgrep
    android-tools
    terraform
    kubernetes
    minikube
    awscli2
    python3
    clang
    nodejs
    pnpm
    android-studio-full
    ciscoPacketTracer8
    gh
    python312Packages.pip
    (python311.withPackages(ps: with ps; [ esptool pyserial ]))
    pipenv
    git-lfs
    fritzing
 ];

  
  # virtualization
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;
  users.extraGroups.vboxusers.members = [ "rai" ];
  virtualisation.virtualbox.host.enableHardening = false;


  programs.nix-ld.enable = true;

}
