{ pkgs, ... }: {
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
    nil
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
    vesktop
    slack
    nixpkgs-fmt
    nixd
    nixfmt-rfc-style
    spotify
    (import ../../scripts/rebuild.nix { inherit pkgs; })
  ];
}
