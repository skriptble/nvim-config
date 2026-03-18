return {
    "vim-airline/vim-airline",
    dependencies = {
        "vim-airline/vim-airline-themes",
    },
    init = function()
        vim.g.airline_theme = 'hybrid'
        vim.g.airline_powerline_fonts = 1
        vim.g['airline#extensions#tabline#enabled'] = 1
        vim.g['airline#extensions#tabline#show_buffers'] = 1
        vim.g['airline#extensions#tabline#buffer_idx_mode'] = 1
        vim.g['airline#extensions#tabline#buffer_nr_show'] = 1
    end,
    config = function()
        -- Fix highlight problems in NeoVim 0.11
        -- https://github.com/vim-airline/vim-airline/issues/2693
        vim.api.nvim_set_hl(0, 'StatusLine', {})
        vim.api.nvim_set_hl(0, 'StatusLineNC', {})
        vim.api.nvim_set_hl(0, 'TabLine', {})
        vim.api.nvim_set_hl(0, 'WinBar', {})
    end
}
