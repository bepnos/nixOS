let
    pkgsnode = import (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/7a339d87931bba829f68e94621536cad9132971a.tar.gz"; # Node 20.11.0
    }) {};
    pkgsyarn = import (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/e08a8231e2c827f586e64727c1063c5e61dbc00d.tar.gz"; # yarn-berry 4.1.1
    }) {};
    pkgs = pkgsnode // pkgsyarn;
    node = pkgs.elmPackages.nodejs;
    yarn = pkgs.yarn-berry;

in pkgs.mkShell {
  nativeBuildInputs = [node yarn];
}