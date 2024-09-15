{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim 
    wget
    kitty
    git
    google-chrome
    fastfetch
    wofi
    pavucontrol
    oh-my-zsh
    alacritty
    hyprpaper
    nixd
    thefuck
    meslo-lgs-nf
    flameshot
    btop
    hyprshot
    numix-cursor-theme
    (import ../../scripts/rebuild.nix { inherit pkgs; })
  ];
}