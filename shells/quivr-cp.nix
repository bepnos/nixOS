{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [nodejs_20 yarn-berry];
  VIRTUAL_ENV = "cp";
}