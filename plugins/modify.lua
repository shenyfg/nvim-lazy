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
      }

      for i = 1, 5 do
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
}
