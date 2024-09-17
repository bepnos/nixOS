{ ... }:
{
  ##############################
  # Waybar Configuration
  ##############################
  programs.waybar = {
    enable = true;
    settings.mainbar = {
      modules-left = [ "hyprland/workspaces" ];

      modules-center = [ "clock" ];

      modules-right = [
        "network"
        "battery"
        "pulseaudio"
      ];

      "hyprland/workspaces" = {
        format = " {icon} ";
        format-icons = {
          "1" = "";
          "2" = "";
          "3" = "";
          "4" = "";
          "5" = "󰙯";
          "6" = "";
        };
      };
      network = {
        interval = 5;
        format-wifi = " ";
        format-ethernet = " ";
        format-disconnected = " ";
        on-click = "nm-connection-editor";
      };

      pulseaudio = {
        scroll-step = 1;
        format = " {icon} {volume}%";
        format-bluetooth = "{volume}% {icon} ";
        format-muted = "󰸈";
        on-click = "pavucontrol";
        on-click-right = "pamixer -t";
      };
    };

  };
}
