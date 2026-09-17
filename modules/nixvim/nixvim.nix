{ inputs, ... }:
{
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
}
