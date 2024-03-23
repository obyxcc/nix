{ pkgs, lib, inputs, ... }:
{
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  programs.nixvim = {
    enable = true;

    options = {
      number = true;         # Show line numbers
      relativenumber = true; # Show relative line numbers

      shiftwidth = 2;        # Tab width should be 2
      termguicolors = true;

      splitbelow = true; # fix splits
      splitright = true; # fix splits 

      undofile = true;

      smartindent = true;
      showmode = false;
    };

    plugins = {
      lualine = {
	enable = true;
	componentSeparators.left = "|";
	componentSeparators.right = "|";
	sectionSeparators.left = "";
	sectionSeparators.right = "";
	disabledFiletypes.statusline = [
	  "NvimTree"
	];
      };
      barbecue.enable = true;
      noice.enable = true;
      barbar = {
	enable = true;
	animation = false;
	keymaps = {
	  close = "<leader>x";
	  next = "<tab>";
	  previous = "<S-tab>";
	};
	sidebarFiletypes = {
	  "NvimTree" = true;
	};
      };
      comment-nvim.enable = true;
      treesitter.enable = true;
      nvim-autopairs.enable = true;
      nvim-tree = {
	enable = true;
	hijackNetrw = true;
	autoClose = true;
      };
      nvim-cmp = {
	enable = true;
	autoEnableSources = true;
	sources = [
	  {name = "nvim_lsp";}
	  {name = "path";}
	  {name = "buffer";}
	  {name = "luasnip";}
	];
	mapping = {
	  "<CR>" = "cmp.mapping.confirm({ select = true })";
	  "<Tab>" = {
	    action = ''
	      function(fallback)
		if cmp.visible() then
		  cmp.select_next_item()
		else
		  fallback()
		end
	      end
	    '';
	    modes = [ "i" "s" ];
	  };
	};
      };
      nvim-colorizer.enable = true;
      tmux-navigator.enable = true;
      indent-blankline.enable = true;
      gitsigns.enable = true;
      neogit.enable = true;
      telescope = {
	enable = true;
	keymaps = {
	  "<C-p>" = {
	    action = "git_files";
	    desc = "Telescope Git Files";
	  };
	  "<leader>ff" = "find_files";
	  "<leader>fg" = "live_grep";
	  "<leader>fo" = "oldfiles";
	  "<leader>fb" = "buffers";
	};
      };
      #obsidian = {
	#enable = true;
	#workspaces = [
	  #{
	    #name = "personal";
	    #path = "~/Sync/vaults/personal";
	  #}
	#];
      #};
    };

    colorschemes.catppuccin.enable = true;
      plugins.lsp = {
	enable = true;

	servers = {
	  tsserver.enable = true;
	  # emmet_ls = true;

	  lua-ls = {
	    enable = true;
	    settings.telemetry.enable = false;
	  };
  	};
      };

    globals.mapleader = " ";

    keymaps = [
      # Nvim Tree
      { # toggle nvim-tree
	action = "<cmd>NvimTreeToggle<CR>";
	key = "<C-n>";
	mode = "n";
      }
      { # focus nvim-tree
	action = "<cmd>NvimTreeFocus<CR>";
	key = "<leader>e";
	mode = "n";
      }

      # NeoGit
      { # open neogit
	action = "<cmd>Neogit<CR>";
	key = "<leader>gi";
	mode = "n";
      }

      # Editor
      { # clear highlights
	action = "<cmd> noh <CR>";
	key = "<Esc>";
	mode = "n";
      }
      { # stay in one place when moving
	action = "<C-d>zz";
	key = "<C-d>";
	mode = "n";
      }
      { # stay in one place when moving
	action = "<C-u>zz";
	key = "<C-u>";
	mode = "n";
      }
      { # keep cursor centered when searching
	action = "nzzzv";
	key = "n";
	mode = "n";
      }
      { # keep cursor centered when searching
	action = "Nzzzv";
	key = "N";
	mode = "n";
      }
      { # substitute current word
	action = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>";
	key = "<leader>s";
	mode = "n";
      }
      { # move between splits (left)
	action = "<C-w>h";
	key = "<C-h>";
	mode = "n";
      }
      { # move between splits (down)
	action = "<C-w>j";
	key = "<C-j>";
	mode = "n";
      }
      { # move between splits (up)
	action = "<C-w>k";
	key = "<C-k>";
	mode = "n";
      }
      { # move between splits (right)
	action = "<C-w>l";
	key = "<C-l>";
	mode = "n";
      }
      { # move highlighted lines (up)
	action = ":m '<-2<CR>gv=gv";
	key = "K";
	mode = "v";
      }
      { # move highlighted lines (down)
	action = ":m '>+1<CR>gv=gv";
	key = "J";
	mode = "v";
      }
      { # outdent highlighted lines
	action = "<gv";
	key = "<";
	mode = "v";
      }
      { # indent highlighted lines
	action = ">gv";
	key = ">";
	mode = "v";
      }
    ];
  };
}
