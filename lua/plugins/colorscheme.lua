return {
  "kristijanhusak/vim-hybrid-material",
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme hybrid_reverse]])
    vim.g.enable_bold_font = true -- Uses bold font for functions and the like
  end
}
