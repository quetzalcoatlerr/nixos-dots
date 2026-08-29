{ config, pkgs, ... }:
{
  xdg.configFile."niri/config.kdl".source = ./config.kdl;

  home.packages = with pkgs; [
    wl-clipboard
    noctalia
    fuzzel
    xwayland-satellite
    swaylock
  ];
}
