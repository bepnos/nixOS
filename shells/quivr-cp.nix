let pkgs = import <nixpkgs> {};

    buildNodejs = pkgs.callPackage <nixpkgs/pkgs/development/web/nodejs/nodejs.nix> {};
    
    nodejs-20 = buildNodejs {
      enableNpm = true;
      version = "20.11.0";
    };

in pkgs.mkShell rec {
  name = "webdev";
  
  buildInputs = with pkgs; [
    nodejs-20
    (yarn.override { nodejs = nodejs-8; })
  ];
}