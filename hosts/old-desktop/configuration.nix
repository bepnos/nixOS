{ inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
    inputs.home-manager.nixosModules.default
  ];
  networking.hostName = "old-desktop";
  system.stateVersion = "24.05";
  environment.sessionVariables.NIXOS_OZONE_WL = "0";

  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };
    users = {
      "bepnos" = import ./home.nix;
    };
    backupFileExtension = "old";
  };
}
