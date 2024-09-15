{  pkgs, ... }:
{
  home = {
    username = "bepnos";
    homeDirectory = "/home/bepnos";
    stateVersion = "24.05";
    sessionVariables.EDITOR = "vim";
  };

  nixpkgs.config.allowUnfree = true;
  programs = {
    home-manager.enable = true;
    vscode = {
      enable = true;
      package = pkgs.vscode.fhs;
    };
  };

  imports = [
    ../../modules/home-manager
  ];
}
