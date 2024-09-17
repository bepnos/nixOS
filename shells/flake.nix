{
  description = "Flake for development shells";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05"; # Most shells will not need cutting edge nixpkgs
    yarn-cp.url = "nixpkgs/a9858885e197f984d92d7fe64e9fff6b2e488d40"; # 4.2.2
    nodejs-cp.url = "nixpkgs/080a4a27f206d07724b88da096e27ef63401a504"; # 20.11.1
  };

  outputs = { self , nixpkgs, ... }@inputs: 
  let 
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    devShells."x86_64-linux".default = pkgs.mkShell { 
      nativeBuildInputs = with pkgs; [
        inputs.yarn-cp.legacyPackages.${system}.yarn-berry
        inputs.nodejs-cp.legacyPackages.${system}.nodejs_20
      ];
    };
  };
}