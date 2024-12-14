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
        "vscord.app.id" = "1206940027200733234";
        "C_Cpp.intelliSenseEngine" = "disabled";
        "python.analysis.inlayHints.functionReturnTypes" = true;
        "latex-utilities.liveReformat.enabled" = true;
        "latex-workshop.linting.chktex.exec.args" = [
          "-wall"
          "-n22"
          "-n30"
          "-e16"
          "-q"
          "-n3"
          "-n44"
          "-n1"
          "-n41"
          "-n46"
          "-n24"
        ];
        "latex-workshop.linting.chktex.enabled" = true;
        "latex.linter.enabled" = false;
        "latex-workshop.view.pdf.invert" = 1;
      };
    };
  };
}
