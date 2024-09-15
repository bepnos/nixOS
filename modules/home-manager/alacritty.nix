{...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      import = ["~/nixos/assets/catpuccin_mocha.toml"];
      font = {
        size = 13;
        normal = {
          family = "MesloLGS NF";
          style = "Regular";
        };
      };
      window.opacity = 0.8;
    };
  };
}