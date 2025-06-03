return {
  {
    "keaising/im-select.nvim",
  },
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      keymaps = {
        ["q"] = { "actions.close", mode = "n" },
        ["<Esc>"] = { "actions.close", mode = "n" },
        ["="] = { "actions.select", mode = "n" },
      },
    },
    keys = {
      {
        mode = { "n" },
        "-",
        "<CMD>Oil --float<CR>",
        desc = "Open parent directory",
      },
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
  },
}
