{
  plugins = {
    lsp-format = {
      enable = true;
    };
    fugitive.enable = true;
    lsp = {
      enable = true;
      servers = {
        html = {
          enable = true;
        };
        ts_ls = {
          enable = true;
        };
        clangd = {
          enable = true;
        };
        tflint.enable = true;
        lua_ls = {
          enable = true;
          settings = {
            runtime = {
              version = "LuaJIT";
            };
            diagnostics = {
              globals = ["vim"];
            };
            workspace.library = ["vim.api.nvim_get_runtime_file('*.lua', true)"];
          };
        };
        nixd = {
          enable = true;
          settings = {
            nixpkgs = {
              expr = "import <nixpkgs> { }";
            };
            formatting = {
              command = ["alejandra"];
            };
            options = {
              nixos = {
                expr = ''(builtins.getFlake "/home/taemamoo/dotfiles").nixosConfigurations.taes-lap.options'';
              };
              home_manager = {
                expr = ''(builtins.getFlake "/home/taemamoo/dotfiles").homeConfigurations."taemamoo@taes-lap".options'';
              };
              nixvim.expr = ''(builtins.getFlake "/home/taemamoo/Documents/neovims/nixvim").packages.x86_64-linux.neovimNixvim.options'';
            };
            diagnostic = {
              suppress = [
                "sema-extra-with"
              ];
            };
          };
        };
        gopls = {
          enable = true;
          settings = {
            hints = {
              rangeVariableTypes = true;
              constantValues = true;
              parameterNames = true;
              assignVariableTypes = true;
              compositeLiteralFields = true;
              compositeLiteralTypes = true;
              functionTypeParameters = true;
            };
          };
        };
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
        ltex = {
          enable = true;
          settings.dictionary = {
            "en-US" = [
              ":/home/devontae78/.local/share/nvim/site/spell/en.utf-8.add"
            ];
          };
        };
        htmx = {
          enable = true;
        };
        cssls = {
          enable = true;
          settings = {
            css = {
              validate = false;
              lint = {
                unknownAtRules = "ignore";
              };
            };
            scss = {
              validate = true;
            };
          };
        };
        cmake = {
          enable = true;
        };
        pyright = {
          enable = true;
        };
      };
      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>vws" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };
          "<leader>vrr" = {
            action = "references";
            desc = "Goto References";
          };
          "<leader>vrn" = {
            action = "rename";
            desc = "Rename";
          };
          "<leader>vca" = {
            action = "code_action";
            desc = "Code Action";
          };
        };
        diagnostic = {
          "<leader>vd" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "[d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };

      onAttach = ''
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
        end

         if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          end, '[T]oggle Inlay [H]ints')
        end
      '';
    };
  };
}
