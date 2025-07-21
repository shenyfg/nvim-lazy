return {
  {
    "ThePrimeagen/harpoon",
    keys = function()
      local keys = {
        {
          "<leader>H",
          function()
            require("harpoon.mark").add_file()
          end,
          desc = "Harpoon File",
        },
        {
          "<leader>h",
          function()
            require("harpoon.ui").toggle_quick_menu()
          end,
          desc = "Harpoon Quick Menu",
        },
        {
          "<C-n>",
          function()
            require("harpoon.ui").nav_next()
          end,
          desc = "Harpoon navigates to next mark ",
        },
        {
          "<C-p>",
          function()
            require("harpoon.ui").nav_prev()
          end,
          desc = "Harpoon navigates to previous mark ",
        },
      }

      for i = 1, 9 do
        table.insert(keys, {
          "<C-" .. i .. ">",
          function()
            require("harpoon.ui").nav_file(i)
          end,
          desc = "Harpoon to File " .. i,
        })
      end
      return keys
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      { "<leader>gp", mode = { "n", "v" }, "<Cmd>Gitsigns preview_hunk<CR>" },
      { "<leader>gu", mode = { "n", "v" }, "<Cmd>Gitsigns reset_hunk<CR>" },
      { "<leader>gU", mode = { "n", "v" }, "<Cmd>Gitsigns reset_buffer<CR>" },
    },
  },
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>sr",
        function()
          Snacks.picker.resume()
        end,
        desc = "Resume",
      },
    },
    opts = {
      picker = {
        win = {
          input = {
            keys = {
              ["o"] = { "confirm", mode = { "n" } },
            },
          },
        },
        sources = {
          explorer = {
            win = {
              list = {
                keys = {
                  ["o"] = { "confirm", mode = "n" },
                  ["O"] = { "explorer_open", mode = "n" },
                },
              },
            },
          },
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    -- Remove symbols in lualine
    opts = function()
      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local icons = LazyVim.config.icons

      vim.o.laststatus = vim.g.lualine_laststatus

      local opts = {
        options = {
          theme = "auto",
          globalstatus = vim.o.laststatus == 3,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },

          lualine_c = {
            LazyVim.lualine.root_dir(),
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { LazyVim.lualine.pretty_path() },
          },
          lualine_x = {
            Snacks.profiler.status(),
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = function() return { fg = Snacks.util.color("Statement") } end,
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = function() return { fg = Snacks.util.color("Constant") } end,
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = function() return { fg = Snacks.util.color("Debug") } end,
          },
          -- stylua: ignore
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = function() return { fg = Snacks.util.color("Special") } end,
          },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },
          lualine_y = {
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            function()
              return " " .. os.date("%R")
            end,
          },
        },
        extensions = { "neo-tree", "lazy", "fzf" },
      }

      return opts
    end,
  },
}
