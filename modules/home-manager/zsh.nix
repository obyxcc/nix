{ pkgs, config, ... }: 
let
  shellAliases = {
    "rb" = "sudo nixos-rebuild switch --flake ~/.config/nixos/hosts/#xps";
    "ls" = "eza -Al --color";
    "grep" = "grep --color=auto";
    "df" = "df -h";
    "free" = "free -h";
    "mci" = "sudo make clean install";
    "mc" = "make clean";
    "cat" = "bat";
    "ip" = "ip -c";
  };
in
{
  programs = {
    thefuck.enable = true;
    zsh = {
      inherit shellAliases;
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;
      history.size = 10000;
      history.path = "${config.xdg.dataHome}/zsh/history";
      initExtra = ''
	zstyle ':completion:*' menu select
	eval "$(starship init zsh)"
      '';
    };
  };
}
