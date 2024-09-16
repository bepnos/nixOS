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
    apple-cursor
    xorg.xeyes
    waybar
    networkmanagerapplet
    pamixer
    discord
    (import ../../scripts/rebuild.nix { inherit pkgs; })
  ];
}