{ pkgs, inputs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {

      exec-once = [
        "kanshi"
        "ags"
        "hyprpaper"
        "hypridle"
      ];

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = "yes";
        };
        sensitivity = 0;
      };

      general = {
        gaps_in = 4;
        gaps_out = 8;
        border_size = 0;
        
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "master";

        allow_tearing = false;
      };

      decoration = {
        rounding = 10;

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };

        drop_shadow = "no";
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations  = {
        enabled = "yes";

        bezier = "myBezier, 0.05, 0.3, 0.2, 1.05";

        animation = [
          "windows, 1, 1.4, myBezier"
          "windowsOut, 1, 1.4, myBezier"
          "border, 1, 1.4, myBezier"
          "borderangle, 1, 1.4, myBezier"
          "fade, 1, 1, myBezier"
          "workspaces, 1, 1.4, myBezier"
        ];	    
      };

      layerrule = [
        "blur, gtk-layer-shell"
        "ignorezero, gtk-layer-shell"
      ];

      master = {
        new_is_master = false;
      };

      gestures = {
        workspace_swipe = true;
      };

      misc = {
        force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
	vrr = 1;
      };

      device = {
        name = "logitech-usb-receiver";
        sensitivity = -1.0;
      };

      # Example windowrule v1
      # windowrule = float, ^(kitty)$
      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
      windowrulev2 = "suppressevent maximize, class:.*"; # You'll probably like this.
     
      "$mod" = "SUPER";

      bind = [
        "$mod, D, exec, tofi-run | xargs hyprctl dispatch exec --"
        "$mod, RETURN, exec, foot"
        "$mod SHIFT, Q, killactive,"
        "$mod SHIFT, space, togglefloating,"

        "$mod, TAB, focuscurrentorlast"

        "$mod, period, splitratio, +0.05"
        "$mod, comma, splitratio, -0.05"

        "$mod, J, layoutmsg, cyclenext"
        "$mod, K, layoutmsg, cycleprev"
        "$mod SHIFT, J, layoutmsg, swapnext"
        "$mod SHIFT, K, layoutmsg, swapprev"

        "$mod, F, fullscreen"

        "$mod SHIFT, RETURN, layoutmsg, swapwithmaster"

        "$mod, insert, layoutmsg, addmaster"
        "$mod, delete, layoutmsg, removemaster"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        "$mod SHIFT, ESCAPE, exit,"

        "$mod, mouse_down, workspace, e-1"
        "$mod, mouse_up, workspace, e+1"

        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"

        ", XF86AudioMedia, exec, playerctl play-pause"
        ", XF86AudioStop, exec, playerctl stop"

        ", XF86MonBrightnessUp, exec, brillo -A 10"
        ", XF86MonBrightnessDown, exec, brillo -U 10"

        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_SINK@ 0.05+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 0.05-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"

        "$mod SHIFT, A, exec, foot -e pulsemixer"
        "$mod SHIFT, N, exec, foot -e yazi"
        "$mod SHIFT, P, exec, foot -e htop"
        "$mod SHIFT, V, exec, foot -e nvtop"
        "$mod SHIFT, M, exec, foot -e cmus"
        "$mod, p, exec, waypass"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
	  };
  };
}
