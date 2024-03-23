{ config, lib, pkgs, ... }: {
  powerManagement.enable = true;
  services.thermald.enable = true;
  services.auto-cpufreq.enable = true;
}
