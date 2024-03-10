{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    mouse = true;
    plugins = [
      {
      	plugin = pkgs.tmuxPlugins.vim-tmux-navigator;
      }
      {
	plugin = pkgs.tmuxPlugins.catppuccin;
	extraConfig = '' 
	set -g @catppuccin_flavour 'mocha'
	set -g @catppuccin_window_tabs_enabled on
	set -g @catppuccin_date_time "%H:%M"
	'';
      }
    ];
    extraConfig = ''
      set -g prefix C-a
      unbind C-b
      bind-key C-a send-prefix

      unbind %
      bind | split-window -h

      unbind '"'
      bind - split-window -v
    '';
  };
}
