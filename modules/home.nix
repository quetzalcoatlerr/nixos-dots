{ config, pkgs, inputs, ... }:

{
  home.username = "quetzal";
  home.homeDirectory = "/home/quetzal";
  home.stateVersion = "26.05";
  
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./niri/niri.nix
    ./zellij/zellij.nix
  ];

  # home packages
  home.packages = with pkgs; [
    gcc 
    gnumake 
    ripgrep 
    curl 
    wget 
    comma
    
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

    thunar
    thunar-archive-plugin
    tumbler
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

      drun() {
        docker run --rm -it "$1" /bin/bash
      }
    '';
  };

  xdg.configFile."ghostty/config".text = ''
    window-decoration = false
    window-width = 1600
    window-height = 1000

    window-padding-x = 6
    window-padding-y = 6

    font-family = "Departure Mono"
    font-family = "JetBrainsMono Nerd Font"
    font-size = 16.5
    font-thicken = false

    theme = Kanagawa Dragon
    background-opacity = 0.8
    background-blur = false
  '';

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
    colorschemes.kanagawa.enable = true;

    plugins = {
      lualine.enable = true;
      bufferline.enable = true;
      treesitter.enable = true;
      telescope.enable = true;
      neo-tree.enable = true;
      which-key.enable = true;
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

  programs.home-manager.enable = true;
}
