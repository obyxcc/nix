{ config, lib, pkgs, inputs, ... }: {

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;

    substituters = ["https://hyprland.cachix.org"]; # cache for hyprland build
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="]; # cache for hyprland build
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Set your time zone.
  time.timeZone = "America/New_York";


  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

   environment.systemPackages = with pkgs; [
      bat
      thunderbird
      htop
      pulsemixer
      eza
      spotify
      catppuccin-gtk
      fastfetch
      git
      foot
      hyprpaper
      hyprshot
      hypridle
      hyprlock
      kanshi
      tofi
      syncthing
      gimp
      cmus
      obsidian
      inkscape
      blender
      mpv
      zathura
      zip
      unzip
      ripgrep #nvim *FIXME
      wl-clipboard
     (pass.withExtensions (ext: [  # Base pass secret mgr + extensions
        ext.pass-otp # one time passwords
        ext.pass-genphrase # generate memorable passphrases
        ext.pass-import    # import from other password managers
        ext.pass-update    # helpful password change workflow
      ]))
   ];

  security.sudo.wheelNeedsPassword = false;
  security.rtkit.enable = true;
  security.polkit.enable = true;
}
