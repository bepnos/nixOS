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
    (import ../../scripts/rebuild.nix { inherit pkgs; })
  ];
}