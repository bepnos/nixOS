let
    pkgs = import (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/7a339d87931bba829f68e94621536cad9132971a.tar.gz"; # Node 20.11.0
    }) {};
    node = pkgs.elmPackages.nodejs;

in pkgs.mkShell {
  nativeBuildInputs = [node pkgs.yarn-berry];
}