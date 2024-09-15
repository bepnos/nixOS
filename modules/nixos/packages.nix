{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim 
    wget
    kitty
    git
    google-chrome
    neofetch
    wofi
    pavucontrol
    oh-my-zsh
    alacritty
    hyprpaper
    nixd
    thefuck
  ];
}