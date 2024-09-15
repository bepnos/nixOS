{...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 13;
        normal = {
          family = "MesloLGS NF";
          style = "Regular";
        };
      };
      opacity = 0.8;
    };
  };
}