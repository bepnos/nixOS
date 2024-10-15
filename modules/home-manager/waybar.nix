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

      clock = {
        "format" = "{:%H:%M}";
        "format-alt" = "{:%A, %B %d, %Y (%R)}";
        "tooltip-format" = "<tt><small>{calendar}</small></tt>";
        "calendar" = {
          "mode" = "year";
          "mode-mon-col" = 3;
          "weeks-pos" = "right";
          "on-scroll" = 1;
          "format" = {
            "months" = "<span color='#ffead3'><b>{}</b></span>";
            "days" = "<span color='#ecc6d9'><b>{}</b></span>";
            "weeks" = "<span color='#99ffdd'><b>W{}</b></span>";
            "weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
            "today" = "<span color='#ff6699'><b><u>{}</u></b></span>";
          };
        };
        "actions" = {
          "on-click-right" = "mode";
          "on-scroll-up" = "shift_up";
          "on-scroll-down" = "shift_down";
        };
      };

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
