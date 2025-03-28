{
  plugins.conform-nvim = {
    enable = true;

    settings = {
      notify_on_error = false;

      formatters_by_ft = {
        lua = [
          "stlua"
        ];
        javascript = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          timeout_ms = 2000;
          stop_after_first = true;
        };
      };
    };
  };
}
