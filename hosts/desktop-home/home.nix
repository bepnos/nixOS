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
      userSettings = {
        "keyboard.dispatch" = "keyCode";
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
      };
    };
    btop.enable = true;
  };
  imports = [
    ../../modules/home-manager
  ];
  gtk.cursorTheme.size = 10;
  gtk.cursorTheme.name = "macOS";
}
