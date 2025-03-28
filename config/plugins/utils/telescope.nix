{
  plugins.web-devicons.enable = true;
  plugins.telescope = {
    enable = true;

    keymaps = {
      "<leader>pf" = "find_files";
      "<C-p>" = "git_files";
      "<leader>pws" = "live_grep";
      "<leader>vh" = "help_tags";
    };

    settings.defaults = {
      file_ignore_patterns = [
        "^.git/"
        "^output/"
        "^data/"
        "^node_modules/"
        "^target/"
      ];
      set_env.COLORTERM = "truecolor";
    };
  };
}
