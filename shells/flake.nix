{
  description = "Flake for development shells";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05"; # Most shells will not need cutting edge nixpkgs
    yarn-cp.url = "nixpkgs/a9858885e197f984d92d7fe64e9fff6b2e488d40"; # 4.2.2
    nodejs-cp.url = "nixpkgs/10b813040df67c4039086db0f6eaf65c536886c6"; # 20.11.0
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells."x86_64-linux" = {
        cp = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            inputs.yarn-cp.legacyPackages.${system}.yarn-berry
            inputs.nodejs-cp.legacyPackages.${system}.nodejs_20
          ];
        };
        python = pkgs.buildFHSUserEnv {
          
            python3
            python312Packages.numpy
            python312Packages.pandas
            python312Packages.scipy
          ];
        };
      };
    };
}
