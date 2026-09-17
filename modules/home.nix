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
    ./nixvim/nixvim.nix
    ./yazi/yazi.nix
  ];

  # home packages
  home.packages = with pkgs; [
    gcc 
    gnumake 
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

  xdg.configFile."direnv/direnv.toml".text = ''
    [global]
    hide-env-diff = true
  '';

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
