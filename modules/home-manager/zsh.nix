{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;

    plugins = [
      {
        name = "powerlevel10k-config";
        src = ../../assets;
        file = "p10k.zsh";
      }
      {
        name = "zsh-powerlevel10k";
        src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
        file = "powerlevel10k.zsh-theme";
      }
    ];
  };
}
