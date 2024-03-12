{pkgs, ...}: {
  services.kanshi = {
    enable = true;
    systemdTarget = "xdg-desktop-portal-hyprland.service";
    profiles = {
      undocked = {  
	outputs = [    
	  {      
	    criteria = "eDP-1";    
	    scale = 1.25;
	  } 
	];
      };
      docked = {  
	outputs = [    
	  {      
	    criteria = "eDP-1";    
	    scale = 1.25;
	    position = "0,0";
	  }    
	  {      
	    criteria = "Microstep MSI G32C4 0x0000040A";      
	    mode = "1920x1080@165";    
	    position = "1536,0";
	  }  
	];
      };
    };
  };
}
