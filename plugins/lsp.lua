return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = {
          init_options = {
            settings = {
              lint = {
                enable = false,
              },
            },
          },
        },
      },
      document_highlight = {
        enabled = false, -- Disable highlight the same words
      },
      inlay_hints = { enabled = false },
    },
  },
}
