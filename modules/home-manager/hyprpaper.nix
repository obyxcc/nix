{pkgs, ...}: {
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    ### NEEDS FIXING ###
    preload = ${/home/cole/pic/wallpapers/magenta_blue.png}

    #set the default wallpaper(s) seen on inital workspace(s) --depending on the number of monitors used
    wallpaper = ,${/home/cole/pic/wallpapers/magenta_blue.png}

  '';
}
