{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      log = {    
	enabled = true;  
      };  
      manager = {    
	show_hidden = true;    
	sort_by = "natural";    
	sort_dir_first = true;    
	sort_reverse = false;  
      };
    };
  };
}
