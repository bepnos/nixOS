{ inputs, config, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
    inputs.home-manager.nixosModules.default
  ];
  networking.hostName = "old-desktop";
  system.stateVersion = "24.05";

  hardware.opengl.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.latest;
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
  };

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
