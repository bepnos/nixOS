{
  description = "Flake for development shells";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05"; # Most shells will not need cutting edge nixpkgs
    nodejs-cp.url = "github:nixos/nixpkgs/080a4a27f206d07724b88da096e27ef63401a504";
  };

  outputs = { self , nixpkgs, ... }@inputs: 
  let 
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    devShells."x86_64-linux".default = pkgs.mkShell { 
      nativeBuildInputs = with pkgs; [
        yarn-berry
        inputs.nodejs-cp.legacyPackages.${system}.nodejs_20
      ];
    };
  };
}