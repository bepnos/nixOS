{...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      import = ["../../assets/catpuccin_macchiato.toml"];
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