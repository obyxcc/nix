{ config, lib, pkgs, inputs, ... }: {
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ../../modules/nixos/audio.nix
    ../../modules/nixos/nvidia-prime.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "xps"; # Define your hostname.
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


  security.sudo.wheelNeedsPassword = false;
  security.rtkit.enable = true;
  security.polkit.enable = true;
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cole = {
    isNormalUser = true;
    extraGroups = [ 
      "wheel" # Enable ‘sudo’ for the user.
      "networkmanager" 
      "libvirtd" 
    ]; 
    shell = pkgs.zsh;
  };

  home-manager = {
  # also pass inputs to home-manager modules
  extraSpecialArgs = {inherit inputs;};
  useGlobalPkgs = true;
    users = {
      "cole" = import ./home.nix;
    };
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;
  environment.pathsToLink = [ "/share/zsh" ];

   programs.steam = {
     enable = true;
     remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
     dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
     gamescopeSession = {
      enable = true;
      args = [ 
	"-W 1920"
	"-H 1200"
	# "--hdr-enabled"
      ];
     };
   };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs; [
   ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  services.upower.enable = true;
  services.fstrim.enable = true;
  services.syncthing.enable = true;

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

