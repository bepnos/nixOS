{ pkgs, ... }: {
  home = {
    username = "bepnos";
    homeDirectory = "/home/bepnos";
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
 }
