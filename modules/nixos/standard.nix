{ pkgs, inputs, ... }:
{
  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
  nixpkgs.config.allowUnfree = true;

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 7;
  };

  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Brussels";
  i18n.defaultLocale = "en_US.UTF-8";

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  };

  programs.nix-ld = {
    enable = true;
  };

  security.rtkit.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    blueman.enable = true;
    redis.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  fonts.packages = [ pkgs.meslo-lgs-nf ];
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";
    # Old
    # base16Scheme = {
    #   base00 = "24273a"; # base
    #   base01 = "1e2030"; # mantle
    #   base02 = "363a4f"; # surface
    #   base03 = "494d64"; # surface1
    #   base04 = "5b6078"; # surface2
    #   base05 = "cad3f5"; # text
    #   base06 = "f4dbd6"; # rosewater
    #   base07 = "b7bdf8"; # lavender
    #   base08 = "ed8796"; # red
    #   base09 = "f5a97f"; # peach
    #   base0A = "eed49f"; # yellow
    #   base0B = "a6da95"; # green
    #   base0C = "8bd5ca"; # teal
    #   base0D = "8aadf4"; # blue
    #   base0E = "c6a0f6"; # mauve
    #   base0F = "f0c6c6"; # flamingo
    # };
    image = ../../assets/gruvbox-self.png;
    # image = ../../assets/evening-sky.png;
    fonts = {
      monospace = {
        package = pkgs.meslo-lgs-nf;
        name = "MesloLGS NF";
      };
    };
    opacity.terminal = 0.7;

    cursor = {
      package = pkgs.apple-cursor;
      name = "macOS dsfs";
      size = 20;
    };
  };
}
