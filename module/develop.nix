{ config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    vscode
    neovim
    python3
    clang
    nodejs
    pnpm
    gh
    python312Packages.pip
    (python311.withPackages(ps: with ps; [ esptool pyserial ]))
    pipenv
    git-lfs
    fritzing
    code-cursor
 ];

  programs.nix-ld.enable = true;

}
