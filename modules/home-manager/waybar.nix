{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    settings = [
      {  
	layer = "top";    
	position = "bottom";    
	height = 36;    
	# output = [      "eDP-1"      "HDMI-A-1"    ];    
	modules-left = [ 
	  "hyprland/workspaces" 
	  # "sway/mode" 
	];    
	modules-center = [ 
	  # "sway/window" 
	  # "custom/hello-from-waybar" 
	  # "wlr/taskbar" 
	];    
	modules-right = [ 
	  # "mpd" 
	  # "custom/mymodule#with-css-id" 
	  # "temperature" 
	  # "network"
	  "battery"
	  "clock"
	  "tray"
	];    
	# "sway/workspaces" = {      
	#   disable-scroll = true;      
	#   all-outputs = true;    
	# };    
	"battery" = {
	  "states" = {
	      "warning" = 30;
	      "critical" = 15;
	  };
	  "format" = "{icon}  {capacity}";
	  "format-full" = "{icon}  {capacity}";
	  "format-charging" = "󱐋 {capacity}";
	  "format-plugged" = "  {capacity}";
	  "format-alt" = "{icon} {time}";
	  "format-icons" = [" " " " " " " " " "];
	};
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
	style = ''
	  * {    
	    border: none;    
	    border-radius: 0;    
	    font-family: JetBrains Mono;  
	  }  

	  window#waybar {    
	    background: #181825;    
	    color: #cdd6f4;  
	  }  

	  button {
	      /* Use box-shadow instead of border so the text isn't offset */
	      /* box-shadow: inset 0 -3px transparent; */
	      /* Avoid rounded borders under each button name */
	      border: none;
	      border-radius: 0;
	  }

	  /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
	  button:hover {
	      background: inherit;
	      /* box-shadow: inset 0 -3px #313244; */
	  }

	  #workspaces {

	    margin: 8px 2px;
	  }

	  #workspaces button {
	      padding: 0 5px;
	      margin: 0 2px;
	      background-color: transparent;
	      color: #cdd6f4;
	      border-radius: 4px;
	  }

	  #workspaces button:hover {
	      background: rgba(0, 0, 0, 0.2);
	  }

	  #workspaces button.active {
	      background-color: #313244;
	      /* box-shadow: inset 0 -3px #b4befe; */
	  }

	  #workspaces button.urgent {
	      background-color: #f38ba8;
	      color: #181825;
	  }

	  #clock,
	  #battery {
	    background-color: #313244;
	    color: #cdd6f4;
	    margin: 8px 4px 8px 4px;
	    padding: 4px 8px;
	      border-radius: 4px;
	  }


	  '';
  };
}
