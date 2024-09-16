{ pkgs, ... }: {
  users.users.bepnos = {
    isNormalUser = true;
    description = "bepnos";
    extraGroups = [ "networkmanager" "wheel" "input"];
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;
}