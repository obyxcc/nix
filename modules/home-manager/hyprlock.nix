{pkgs, ...}: {
  xdg.configFile."hypr/hyprlock.conf".text = ''
    background {
      path = /home/cole/pic/wallpapers/waves.png
    }
    input-field {
      monitor =
      size = 260, 50
      outline_thickness = 0
      dots_size = 0.33 # Scale of input-field height, 0.2 - 0.8
      dots_spacing = 0.15 # Scale of dots' absolute size, 0.0 - 1.0
      dots_center = false
      dots_rounding = -1 # -1 default circle, -2 follow input-field rounding
      outer_color = rgb(151515)
      inner_color = rgb(127, 132, 156)
      font_color = rgb(180, 190, 254)
      fade_on_empty = true
      fade_timeout = 1000 # Milliseconds before fade_on_empty is triggered.
      placeholder_text = <i>Input Password...</i> # Text rendered in the input box when it's empty.
      hide_input = false
      rounding = 10 # -1 means complete rounding (circle/oval)
      fail_color = rgb(204, 34, 34) # if authentication failed, changes outer_color and fail message color
      fail_text = <i>$FAIL <b>($ATTEMPTS)</b></i> # can be set to empty
      fail_transition = 300 # transition time in ms between normal outer_color and fail_color

      position = 0, -20
      halign = center
      valign = center
    }
    label {
    monitor =
    # text = Hi there, $USER
    text = $TIME
    color = rgba(200, 200, 200, 1.0)
    font_size = 64
    font_family = JetBrains Mono

    position = 0, 80
    halign = center
    valign = center
}

  '';
}
