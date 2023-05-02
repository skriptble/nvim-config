vim.api.nvim_set_hl(0, 'IndentBlanklineIndent1', {fg='#E06C75', nocombine=true})
vim.api.nvim_set_hl(0, 'IndentBlanklineIndent2', {fg='#E5C07B', nocombine=true})
vim.api.nvim_set_hl(0, 'IndentBlanklineIndent3', {fg='#98C379', nocombine=true})
vim.api.nvim_set_hl(0, 'IndentBlanklineIndent4', {fg='#56B6C2', nocombine=true})
vim.api.nvim_set_hl(0, 'IndentBlanklineIndent4', {fg='#61AFEF', nocombine=true})
vim.api.nvim_set_hl(0, 'IndentBlanklineIndent5', {fg='#C678DD', nocombine=true})
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
vim.opt.listchars:append "tab:⋅⋅"

require("indent_blankline").setup {
    space_char_blankline = " ",
    space_char = "⋅",
    char = "│",
    context_char = "│",
    show_current_context = true,
    show_current_context_start = true,
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
