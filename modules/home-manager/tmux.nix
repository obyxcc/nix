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
	set -g @catppuccin_window_right_separator "█ "
	set -g @catppuccin_window_number_position "left"
	set -g @catppuccin_window_middle_separator " | "

	set -g @catppuccin_window_default_fill "none"

	set -g @catppuccin_window_current_fill "all"

	set -g @catppuccin_status_modules_right "application session user host date_time"
	set -g @catppuccin_status_left_separator "█"
	set -g @catppuccin_status_right_separator "█"

	set -g @catppuccin_date_time_text "%Y-%m-%d %H:%M:%S"

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
