{pkgs, ...}: {
  xdg.configFile."hypr/hyprlock.conf".text = ''
    background {
      path = /home/cole/pic/wallpapers/cat-obyx-gradient.png
    }
    input-field {
      monitor =
    }
  '';
}
