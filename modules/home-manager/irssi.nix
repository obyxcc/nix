{pkgs, ...}: {
  programs.irssi = {
    enable = true;
 #    networks = [
 #      {  
	# liberachat = {    
	#   nick = "obyx";    
	#   server = {      
	#     address = "irc.libera.chat";      
	#     port = 6697;      
	#     autoConnect = true;    
	#   };    
	#   channels = {      
	#     nixos.autoJoin = true;    
	#   };  
	# };
 #      }
 #    ];
  };
}
