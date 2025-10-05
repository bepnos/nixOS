{ ... }:
{
  home = {
    username = "bepnos";
    homeDirectory = "/home/bepnos";
    sessionVariables.EDITOR = "vim";
  };

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
  programs.btop.enable = true;

  services.gammastep = {
    enable = true;
    latitude = "51";
    longitude = "4.7";
    tray = true;
  };
}
