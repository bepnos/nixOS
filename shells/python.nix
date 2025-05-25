{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    python311
    python311Packages.black
    python311Packages.xknx
    python311Packages.pytube
    python311Packages.numpy
    python311Packages.python-sat
  ];
  VIRTUAL_ENV = "python";
}
