{ ... }:
{
  ##############################
  # Waybar Configuration
  ##############################
  programs.waybar = {
    enable = true;
    settings.mainbar = {
      modules-left = [
        "hyprland/workspaces"
      ];

      modules-center = [
        "clock"
      ];

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
          "5" = "ﭮ";
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
    };

  };


  ##############################
  # Hyprpaper Configuration
  ##############################
  services.hyprpaper = {
    enable = true;
  };

  ##############################
  # Hyprland Configuration
  ##############################
  wayland.windowManager.hyprland = { 
    enable = true;
    settings = {

      ##############################
      # Input Configuration
      ##############################
      input = {
        sensitivity = -0.15;
        accel_profile = "flat";
        kb_options = "caps:swapescape";
      };

      ##############################
      # Monitor Configuration
      ##############################
      "monitor" = "DP-1, 1920x1080@240, 0x0, 1";
      workspace = [
        "1, monitor:DP-1" # editor / main
        "2, monitor:DP-1" # terminal
        "3, monitor:HDMI-A-1" # browser 
        "4, monitor:HDMI-A-1" # spotify
        "5, monitor:HDMI-A-1" # discord
        "6, monitor:HDMI-A-1" # slack
        "7, monitor:HDMI-A-1"
        "8, monitor:HDMI-A-1"
        "9, monitor:HDMI-A-1"
        "10, monitor:HDMI-A-1"
      ];

      ##############################
      # Keybindings
      ##############################
      "$mainMod" = "SUPER";
      "$menu" = "wofi --show drun";
      bind = [
        "$mainMod SHIFT, Q, killactive"
        "$mainMod, RETURN, exec, alacritty"
        "$mainMod, M, exit"
        "$mainMod, V, togglefloating"
        "$mainMod, D, exec, fuzzel"
        "$mainMod, F, fullscreen"
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod, A, exec, $menu"
        "$mainMod SHIFT, F, exec, firefox"
        "$mainMod SHIFT, S, exec, slack"
        "$mainMod SHIFT, M, exec, spotify"
        ", XF86AudioMute, exec, volumectl toggle-mute"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86MonBrightnessUp, exec, lightctl up 2"
        ", XF86MonBrightnessDown, exec, lightctl down 2"
        "CONTROL SHIFT, comma, exec, playerctl previous"
        "CONTROL SHIFT, period, exec, playerctl next"
        "$mainMod SHIFT, C, exec, hyprctl reload"
        "$mainMod CONTROl, left, movecurrentworkspacetomonitor, eDP-1"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "bindm = $mainMod, mouse:273, resizewindow"
      ];

      windowrule = [
        "float, (nm)"
      ];

    ##############################
    # Other
    ##############################
    exec-once = [
      "hyprpaper"
      "hyprctl setcursor numix-cursor-theme 10"
      "ln -s ~/nixos/assets/macOS ~/.local/share/icons/macOS"
      "hyprctl setcursor macOS 20"
      "nm-applet --indicator"
    ];
    };
  };
}