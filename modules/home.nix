{ pkgs, inputs, ... }:

{
  home.username = "quetzal";
  home.homeDirectory = "/home/quetzal";
  home.stateVersion = "26.05";
  
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./niri/niri.nix
    ./zellij/zellij.nix
    ./ghostty/ghostty.nix
  ];

  # home packages
  home.packages = with pkgs; [
    gcc 
    gnumake 
    ripgrep 
    curl 
    wget 
    comma
    bat
    
    lazygit 
    lazydocker 
    k9s
    
    brave 
    telegram-desktop 
    heroic
    anytype
    webcord
 
    ghostty 
    helix
    fastfetch

    nemo
  ];

  programs.zellij.enable = true;

  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      lg = "lazygit";
      ld = "lazydocker";
      ".." = "cd ..";

      rebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles/#laptop";

    };

    initExtra = ''
      mkcd() {
        mkdir -p "$1" && cd "$1"
      }

      crun() {
        gcc "$1" -Wall -Wextra -o prog && ./prog 
      }

      drun() {
        docker run --rm -it "$1" /bin/bash
      }
    '';
  };

  programs.git = {
    enable = true;
    settings = {
      user = { 
        name = "quetzal";
        email = "examplerr950@gmail.com";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  programs.nixvim = {
    enable = true;

    globals.mapleader = "";

    keymaps = [
      # --- File Navigation (Neo-tree) ---
      {
        mode = "n";
	key = "e";
	action = "Neotree toggle";
      }
      # --- Telescope ---
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<cr>";
      }
      {
        mode = "n";
        key = "<leader>sg";
        action = "<cmd>Telescope live_grep<cr>";
      }
      # --- Bufferline ---
      # Shift+H и Shift+L для быстрого перелистывания файлов
      {
        mode = "n";
        key = "<S-h>";
        action = "<cmd>bprevious<cr>";
      }
      {
        mode = "n";
        key = "<S-l>";
        action = "<cmd>bnext<cr>";
      }
    ];

    colorschemes.kanagawa.enable = true;

    plugins = {
      lualine.enable = true;
      bufferline.enable = true;
      treesitter.enable = true;
      telescope.enable = true;
      neo-tree.enable = true;
      which-key.enable = true;

      dashboard = {
        enable = true;
        settings = {
          theme = "doom";
          config = {
            header = [
              "                                 "
              "  ▗▄▄▄       ▗▄▄▄▄    ▄▄▄▖       "
              "  ▜███▙       ▜███▙  ▟███▛       "
              "   ▜███▙       ▜███▙▟███▛        "
              "    ▜███▙       ▜██████▛         "
              "     ▜███▙       ▜████▛          "
              "      ▜███▙       ▜██▛           "
              "       ▜███▙       ▜▛            "
              "        ▜███▙      ▟█            "
              "         ▜███▙    ▟███           "
              "                                 "
              "          N I X V I M            "
            ];
            center = [
              { action = "Telescope find_files"; desc = " Find file"; icon = " "; key = "f"; }
              { action = "Telescope live_grep";  desc = " Find text"; icon = " "; key = "g"; }
              { action = "qa";                   desc = " Quit";      icon = " "; key = "q"; }
            ];
	  };
	};
      };
      blink-cmp = {
        enable = true;
	settings = {
	  keymap = {
	    preset = "super-tab";
	  };
	};
      };
      notify.enable = true;
      noice = {
        enable = true;
	settings = {
          presets = {
            bottom_search = true;
	    command_palette = true;
	  };
	};
      };

      lsp = {
        enable = true;
	servers = {
          clangd.enable = true;
	  nixd.enable  = true;
	  hls = {
	    enable = true;
	    installGhc = false;
	  };
	};
      };
    };
  };
  
  services.mako = {
    enable = true;
    settings = {
      defaultTimeout = 5000;
      backgroundColor = "#1e1e1e";
      borderColor = "#7fc8ff";
      borderSize = 2;
      borderRadius = 0;
      font = "Monocraft 11";
    }; 
  };

  programs.home-manager.enable = true;
}
