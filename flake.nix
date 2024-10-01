{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    stylix.url = "github:danth/stylix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
      nixosConfigurations = {
        desktop-home = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/desktop-home/configuration.nix
            inputs.stylix.nixosModules.stylix
          ];
        };
        old-desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/old-desktop/configuration.nix
            inputs.stylix.nixosModules.stylix
          ];
        };
      };
    };
}
