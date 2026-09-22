{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
  };

  home.packages = with pkgs; [
    ripdrag           # Drag-and-Drop in Wayland
    ffmpegthumbnailer # Video preview
    p7zip             # archives
    jq                # JSON
    poppler-utils     # PDF
    fd                # ultra-fast find
    ripgrep           # ultra-fast grep
    fzf               # Fuzzy-search
    zoxide            # Smart dirnav
    imagemagick       # Heavy image preview
  ];
}
