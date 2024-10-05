{ pkgs }:
pkgs.writeShellScriptBin "rebuild" ''
   pushd ~/nixos/
   git pull
   echo ":: NixOS rebuilding..."
   sudo nixos-rebuild switch --flake ~/nixos/#$hostname
   if [ ! $? -eq 0 ]; then
     echo ":: Build error!"
     exit 1
   fi
   gen=$(nixos-rebuild list-generations --flake ~/nixos/#default | grep current)
  gennumber=$(echo "$gen" | grep -oE '^[0-9]+')
  gendate=$(echo "$gen" | grep -oE "[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}")
  read -p ":: Enter commit changelog: " changelog
   git add .
   git commit -am "[gen-$gennumber]: $changelog ($gendate)"
   git push
   popd
''
