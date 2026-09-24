{ ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      lg = "lazygit";
      ld = "lazydocker";
      ".." = "cd .."
      
      rebuild = "sudo nixos-rebuil switch --flake ~/.dotfiles/#laptop"
    };

    initExtra = ''
      mkcd() {
        mkdir -p "$1" && cd "$1"
      }

      crun() {
        gcc -Wall -Wextra -Werror -o "${1%.*}" "$1 -lm && "./${1%.*}"
      }

      drun() {
        docker run --rm -it "$1" /bin/bash
      }
    '';
  };
}
