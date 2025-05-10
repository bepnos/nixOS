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
        python = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            python311
            python311Packages.numpy
            python311Packages.pandas
            python311Packages.pip
            python311Packages.matplotlib
            python311Packages.ipykernel
            python311Packages.ray
          ];
          VIRTUAL_ENV = "python";
        };
        bdap = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            clang-tools
            clang
            cmake
            codespell
            conan
            cppcheck
            doxygen
            gtest
            lcov
            vcpkg
            vcpkg-tool
            python311
            python311Packages.numpy
            python311Packages.pandas
            python311Packages.pip
            python311Packages.matplotlib
            gcc
            gradle
            jdk
            maven
            ncurses
            patchelf
            zlib
          ];
        };
        java = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            gcc
            gradle
            jdk
            maven
            ncurses
            patchelf
            zlib
          ];
        };
        idp =
          (pkgs.buildFHSEnv {
            name = "IDP";
            targetPks = pkgs;
            runScript = "~/Repos/KKR/idp3-ide-linux-x64/idp3-ide";
          }).env;
      };
    };
}
