{ config, pkgs, inputs, ... }:
{
  imports = [ 
    inputs.ags.homeManagerModules.default 
    ../../modules/home-manager/hyprland.nix
    ../../modules/home-manager/hyprpaper.nix
    ../../modules/home-manager/hypridle.nix
    ../../modules/home-manager/hyprlock.nix
    ../../modules/home-manager/foot.nix
    ../../modules/home-manager/tofi.nix
    ../../modules/home-manager/ags.nix
    ../../modules/home-manager/nixvim.nix
    ../../modules/home-manager/firefox.nix
    ../../modules/home-manager/zsh.nix
    ../../modules/home-manager/starship.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/tmux.nix
    ../../modules/home-manager/irssi.nix
    ../../modules/home-manager/yazi.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "cole";
  home.homeDirectory = "/home/cole";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
      bat
      brightnessctl
      thunderbird
      fastfetch
      git
      foot
      hyprpaper
      hyprshot
      hypridle
      hyprlock
      kanshi
      tofi
      steam
      prismlauncher
      minigalaxy
      spotify
      webcord
      gimp
      cmus
      htop
      obsidian
      pulsemixer
      eza
      syncthing
      catppuccin-gtk
      inkscape
      blender
      lshw
      mpv
      zathura
      zip
      unzip
      ripgrep #nvim *FIXME
      wl-clipboard
      gamemode
      gamescope
      mangohud
     (pass.withExtensions (ext: [  # Base pass secret mgr + extensions
        ext.pass-otp # one time passwords
        ext.pass-genphrase # generate memorable passphrases
        ext.pass-import    # import from other password managers
        ext.pass-update    # helpful password change workflow
      ]))
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/cole/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    XCURSOR_SIZE = "24";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    NIXOS_OZONE_WL = "1";
    SDL_VIDEODRIVER = "wayland";
    XDG_DATA_HOME = "$HOME/.local/share";
  };

  home.pointerCursor = {
  gtk.enable = true;
  # x11.enable = true;
  package = pkgs.bibata-cursors;
  name = "Bibata-Modern-Classic";
  size = 16;
};

xdg.userDirs = {
  enable = true;
  createDirectories = true;

  music = "mus";
  videos = "vid";
  desktop = ".local/share/desktop";
  pictures = "pic";
  download = "dls";
  documents = "doc";
  templates = ".local/share/templates";
  publicShare = ".local/share/public";
};

gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Lavender-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        size = "compact";
        tweaks = [ "rimless" ];
        variant = "mocha";
      };
    };
  iconTheme = {
    package = pkgs.gnome.adwaita-icon-theme;
    name = "Adwaita";
  };

  font = {
    name = "JetBrainsMono Nerd Font";
    size = 10;
  };
  };


# Now symlink the `~/.config/gtk-4.0/` folder declaratively:
xdg.configFile = {
  "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
  "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
  "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
};

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
