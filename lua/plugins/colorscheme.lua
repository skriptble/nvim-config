return {
  -- {
  --   "kristijanhusak/vim-hybrid-material",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd([[colorscheme hybrid_reverse]])
  --     vim.g.enable_bold_font = true -- Uses bold font for functions and the like
  --   end
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        auto_integrations = true,
      })
      -- vim.cmd.colorscheme "catppuccin"
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "kanagawa-dragon"
    end,
  },
}
