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


  outputs = { nixpkgs, ... } @ inputs: { 
    nixosConfigurations = {
      desktop-home = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/desktop-home/configuration.nix
          inputs.stylix.nixosModules.stylix
        ];
      };
    };
  };
}
