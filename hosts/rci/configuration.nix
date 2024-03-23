{ config, lib, pkgs, inputs, ... }: {
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../default/configuration.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/nvidia-prime.nix
    ../../modules/nixos/laptop.nix
    inputs.home-manager.nixosModules.default
  ];

  networking.hostName = "xps"; # Define your hostname.

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cyoung = {
    isNormalUser = true;
    extraGroups = [ 
      "wheel" # Enable ‘sudo’ for the user.
      "networkmanager" 
      "libvirtd" 
    ]; 
    shell = pkgs.zsh;
  };

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
      "cyoung" = import ./home.nix;
      "cole" = import ../../hosts/xps/home.nix;
    };
  };

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.virtualbox.host = {
    enable = true;
    # enableExtensionPack = true;
  };

  users.extraGroups.vboxusers.members = [ "cyoung" ];

  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;
  environment.pathsToLink = [ "/share/zsh" ];

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
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

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

