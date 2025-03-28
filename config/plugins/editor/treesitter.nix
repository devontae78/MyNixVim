{
  plugins = {
    treesitter = {
      enable = true;
      settings = {
        auto_install = false;
        ensure_installed = ["html" "css" "scss" "markdown" "javascript" "typescript" "tsx" "c" "lua" "vim" "vimdoc" "query" "c_sharp" "go" "http" "cpp"];
        highlight = {
          enable = true;
          additional_vim_regex_highlighting = true;
        };
        sync_install = false;
      };
      nixvimInjections = true;
    };

    treesitter-refactor = {
      enable = true;
      highlightDefinitions = {
        enable = true;

        clearOnCursorMove = false;
      };
    };
    hmts.enable = true;
  };
}
