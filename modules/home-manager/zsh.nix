{ ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;

    oh-my-zsh = {
      enable = true;
      custom = "~/nixos/assets/";
      theme = "powerlevel10k";
      plugins = [
        "git"
        "thefuck"
      ];
    };
  };
}
