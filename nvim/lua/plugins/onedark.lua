return {
  -- add gruvbox
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("onedark").setup({
        style = "darker",
        colors = {
          black = "#000000",
          fg = "#00dd00",
          bg0 = "#000000",
          grey = "#008800",
        },
        highlights = {
          ["@lsp.type.comment"] = { fg = "#00aa00" },
          ["@comment"] = { fg = "#00bb00" },
        },
      })
      -- Enable theme
      require("onedark").load()
    end,
  },
  -- Configure LazyVim to load onedark
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
