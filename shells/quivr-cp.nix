let
    pkgsnode = import (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/7a339d87931bba829f68e94621536cad9132971a.tar.gz"; # Node 20.11.0
    }) {};
    pkgsyarn = import (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/67b4bf1df4ae54d6866d78ccbd1ac7e8a8db8b73.tar.gz"; # yarn-berry 4.2.2
    }) {};
    pkgs = pkgsnode // pkgsyarn;
    node = pkgs.elmPackages.nodejs;
    yarn-berry = pkgs.yarn-berry;

in pkgs.mkShell {
  nativeBuildInputs = [node yarn-berry];
}