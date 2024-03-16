{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    settings = [
      {  
	layer = "top";    
	position = "bottom";    
	height = 32;    
	# output = [      "eDP-1"      "HDMI-A-1"    ];    
	modules-left = [ 
	  "hyprland/workspaces" 
	  # "sway/mode" 
	];    
	modules-center = [ 
	  # "sway/window" 
	  # "custom/hello-from-waybar" 
	  "wlr/taskbar" 
	];    
	modules-right = [ 
	  # "mpd" 
	  # "custom/mymodule#with-css-id" 
	  # "temperature" 
	  "network"
	  "battery"
	  "clock"
	  "tray"
	];    
	# "sway/workspaces" = {      
	#   disable-scroll = true;      
	#   all-outputs = true;    
	# };    
	# "custom/hello-from-waybar" = {      
	#   format = "hello {}";      
	#   max-length = 40;      
	#   interval = "once";      
	#   exec = pkgs.writeShellScript "hello-from-waybar" ''  
	#     echo "from within waybar"      
	#   '';    
	# };  
      }
    ];
  };
  # style = ''
  #   * {    
  #     border: none;    
  #     border-radius: 0;    
  #     font-family: Source Code Pro;  
  #   }  
  #
  #   window#waybar {    
  #     background: #16191C;    
  #     color: #AAB2BF;  
  #   }  
  #
  #   #workspaces button {    
  #     padding: 0 5px;  
  #   }
  #   '';
}
