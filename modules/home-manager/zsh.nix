{ ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;

    oh-my-zsh = {
      enable = true;
      custom = "~/nixos/assets/";
      theme = "sunrise";
      plugins = [
        "git"
        "thefuck"
      ];
    };
  };
}
