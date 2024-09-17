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
        "nix.formatterPath" = "nixpkgs-fmt";
        "nix.serverPath" = "nixd";
        "nix.serverSettings.nixd" = {
          "formatting" = {
            "command" = "nixfmt";
          };
        };
        "editor.defaultFormatter" = "rvest.vs-code-prettier-eslint";
        "editor.formatOnSave" = true;
      };
    };
    btop.enable = true;
  };
}
