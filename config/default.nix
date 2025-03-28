{pkgs, ...}: {
  # Import all your configuration modules here
  colorschemes.rose-pine.enable = true;
  imports = [
    # General Configuration
    ./keymaps.nix
    ./settings.nix
    ./completion.nix

    # Snippets
    ./plugins/snippets/luasnip.nix

    # Editor
    ./plugins/editor/treesitter.nix
    ./plugins/editor/formatting.nix

    # Lsp
    ./plugins/lsp/lsp.nix

    #Ui
    ./plugins/ui/which-key.nix

    # Utils
    ./plugins/utils/telescope.nix
    ./plugins/utils/deepseek.nix
    ./plugins/ui/fidget.nix
  ];

  extraPlugins = with pkgs.vimPlugins; [
    vim-be-good
  ];
}
