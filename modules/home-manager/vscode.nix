{ pkgs, ... }:
{
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
        "editor.formatOnSave" = true;
        "json.format.enable" = false;
        "terminal.integrated.defaultProfile.linux" = "zsh";
        "vim.smartRelativeLine" = true;
        "vscord.app.name" = "Custom";
        "vscord.app.id" = "your mom";
      };
    };
  };
}
