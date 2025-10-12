{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    initExtraFirst = "source ~/.p10k.zsh";
    plugins = [
      {
        name = "zsh-powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    shellAliases = {
      ls = "eza -l";
      sl = "eza -l";
      gc = "git commit";
      gcam = "git commit -am";
      gp = "git push";
      gpl = "git pull";
      gcob = "git checkout -b";
      gco = "git checkout";
    };
    initExtra = "
      function chpwd() {
        emulate -L zsh
        eza -l
      } 
      function develop() {
        nix develop ~/nixos/shells/#$1 --command zsh
      }
    if [[ $TERM_PROGRAM == 'vscode' && -z '$VIRTUAL_ENV' ]]; then
        eval '$(develop python)'
        source /home/bepnos/Repos/deepfin/.venv/bin/activate
    fi
    ";
  };
}
