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
}
