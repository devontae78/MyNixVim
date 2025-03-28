{lib, ...}: {
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  keymaps = let
    normal =
      lib.mapAttrsToList
      (key: action: {
        mode = "n";
        inherit action key;
      })
      {
        "<leader>pv" = ":Ex<CR>";

        "J" = "mzJ`z";
        "<C-d>" = "<C-d>zz";
        "<C-u" = "<C-u>zz";
        "n" = "nzzzv";
        "N" = "Nzzzv";

        "<leader>Y" = ''"+Y'';

        "Q" = "<nop>";

        "<leader>s" = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>";
        "<leader>x" = "<cmd>!chmod +x %<CR>";

        "<leader><leader>w" = ":w<CR>";
        "<leader><leader>m" = ":messages<CR>";
        "<leader>md" = ":MarkdownPreviewToggle<CR>";
        "<leader>rl" = ":lua require('journal.dev').reload()<CR>";
      };
    visual =
      lib.mapAttrsToList
      (key: action: {
        mode = "v";
        inherit action key;
      })
      {
        "<leader>sr" = ":s/\\(.*\\)";
        "J" = ":m '>+1<CR>gv=gv";
        "K" = ":m '<-2<CR>gv=gv";
      };
  in
    lib.nixvim.keymaps.mkKeymaps {options.silent = true;} (normal ++ visual);
}
