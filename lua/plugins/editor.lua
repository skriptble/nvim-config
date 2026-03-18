return {
  { "tpope/vim-sleuth" },
  { "tpope/vim-abolish" },
  { "tpope/vim-speeddating" },
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  { "bronson/vim-trailing-whitespace" },
  { "Raimondi/delimitMate" },
  {
    "barrett-ruth/live-server.nvim",
    init = function()
      vim.g.live_server = {}
    end,
  },
  { "terrastruct/d2-vim", ft = "d2" },
  { "pangloss/vim-javascript" },
  {
    "stevearc/aerial.nvim",
    keys = {
      { "<F8>", "<cmd>AerialToggle<CR>", desc = "Toggle Symbol Browser" },
    },
    opts = {},
  },
  {
    "mbbill/undotree",
    keys = {
      { "<F5>", ":UndotreeToggle<CR>", desc = "Toggle Undotree" },
    },
  },
}
