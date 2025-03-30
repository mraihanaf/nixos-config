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
  ];
}