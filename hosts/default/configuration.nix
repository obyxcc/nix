# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

nix.settings = {
	experimental-features = [ "nix-command" "flakes" ];
    substituters = ["https://hyprland.cachix.org"]; # cache for hyprland build
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="]; # cache for hyprland build
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  services.upower.enable = true;

  security.sudo.wheelNeedsPassword = false;
  

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;
  # Remove sound.enable or set it to false if you had it set previously, as sound.enable is only meant for ALSA-based configurations

	# rtkit is optional but recommended
	security.rtkit.enable = true;
	services.pipewire = {
	  enable = true;
	  alsa.enable = true;
	  alsa.support32Bit = true;
	  pulse.enable = true;
	  # If you want to use JACK applications, uncomment this
	  #jack.enable = true;
	};

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cole = {
     isNormalUser = true;
     extraGroups = [ 
     	"wheel" # Enable ‘sudo’ for the user.
	"networkmanager" 
	"libvirtd" 
     ]; 
     shell = pkgs.zsh;
     packages = with pkgs; [
      bat
      thunderbird
      fastfetch
      neovim
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
      heroic
      spotify
      webcord
      gimp
      yazi
      irssi
      cmus
      htop
      obsidian
      pass-nodmenu
      pulsemixer
      eza
      catppuccin-gtk
      inkscape
      blender
      mpv
      zathura
      zip
      unzip
      ripgrep #nvim *FIXME
     ];
   };

  home-manager = {
  # also pass inputs to home-manager modules
  extraSpecialArgs = {inherit inputs;};
  users = {
    "cole" = import ./home.nix;
  };
};

  security.polkit.enable = true;
	virtualisation.libvirtd.enable = true;
	programs.virt-manager.enable = true;
   nixpkgs.config.allowUnfree = true;

   # Hint Electron apps to use wayland
	environment.sessionVariables = {
	  NIXOS_OZONE_WL = "1";
	  SDL_VIDEODRIVER = "wayland";
	};



   #programs.hyprland = {
   	#enable = true;
	#package = inputs.hyprland.packages.${pkgs.system}.hyprland;
	#xwayland.enable = true;
   #};

   programs.zsh.enable = true;
   environment.pathsToLink = [ "/share/zsh" ];

   programs.steam = {
  	enable = true;
  	remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  	dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
   };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs; [
     #vim  # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     #wget
   ];

   fonts.packages = with pkgs; [
	#(nerdfonts.override { fonts = [ "Jetbrains Mono" ]; })
	nerdfonts
   ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

}

