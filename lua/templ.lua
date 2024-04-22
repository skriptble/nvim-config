vim.api.nvim_create_augroup('TemplFileType', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
    group = 'TemplFileType',
    pattern = { '*.templ' },
    callback = function()
        vim.lsp.buf.format()
    end,
})
-- vim.api.nvim_create_autocmd('BufWritePost', {
--     group = 'TemplFileType',
--     pattern = { '*.templ' },
--     command = '!templ generate -f <afile>',
-- })
vim.api.nvim_create_autocmd('FileType', {
    group = 'TemplFileType',
    pattern = { 'templ' },
    callback = function()
        vim.bo.tabstop = 4
        vim.bo.indentexpr="GoIndent(v:lnum)"
        vim.bo.indentkeys = vim.bo.indentkeys .. "<:>,0=},0="
    end,
})
