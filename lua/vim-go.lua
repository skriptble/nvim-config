vim.g.go_fmt_command = "goimports"
vim.g.syntastic_auto_loc_list = false
vim.g.go_highlight_extra_types = true
vim.g.go_highlight_operators = true
vim.g.go_highlight_functions = true
vim.g.go_highlight_function_calls = true
vim.g.go_highlight_types = true
vim.g.go_highlight_fields = true
vim.g.go_highlight_build_constraints = true
vim.g.go_highlight_generate_tags = true
vim.g.go_highlight_variable_declarations = true
vim.g.go_highlight_variable_assignments = true
vim.g.go_auto_type_info = true
vim.g.go_fmt_experimental = true
vim.g.go_rename_command = 'gopls'
vim.g.go_metalinter_enabled = {
    'govet', 'golint', 'errcheck', 'staticcheck', 'unused', 'gosimple',
   'structcheck', 'varcheck', 'ineffassign', 'deadcode', 'typecheck',
   'misspell', 'interfacer', 'stylecheck', 'gocyclo', 'goconst'}
vim.g.go_list_type = "locationlist"

if vim.g.colors_name == 'hybrid_reverse' then
    vim.api.nvim_set_hl(0, '@variable.go', {fg = '#8abeb7'})
end

vim.api.nvim_create_augroup('VimGoFileType', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
    group = 'VimGoFileType',
    pattern = { 'go' },
    callback = function(args)
        local nmap = function(keys, func, desc)
            if desc then
                desc = 'LSP: ' .. desc
            end

            vim.keymap.set('n', keys, func, { buffer = args.buf, desc = desc })
        end
        vim.keymap.set('n', ',,', '<Plug>(go-sameids-toggle)', { silent = true })
        nmap('<Leader>gsi', '<Plug>(go-implements)', '[G]o [S]how [I]mplementations')
        nmap('<leader>gsr', '<Plug>(go-referrers)', '[G]o [S]how [R]eferrers')
        nmap('<Leader>gscp', '<Plug>(go-channelpeers)', '[G]o [S]how [C]hannel [P]eers')
        nmap('<Leader>gsce', '<Plug>(go-callees)', '[G]o [S]how [C]al[e]es')
        nmap('<Leader>gscr', '<Plug>(go-callers)', '[G]o [S]how [C]alle[r]s')
        nmap('<Leader>gsd', '<Plug>(go-doc)', '[G]o [S]how [D]oc')
        nmap('<Leader>gsv', '<Plug>(go-doc-vertical)', '[G]o [S]how Doc [V]ertical')
        nmap('<Leader>gspt', '<Plug>(go-pointsto)', '[G]o [S]how [P]oints [T]o')
        nmap('<Leader>gswe', ':GoWhicherrs<CR>', '[G]o [S]how [W]hich [E]rrs')
        nmap('<Leader>gr', '<Plug>(go-run)', '[G]o [R]un')
        nmap('<Leader>grt', '<Plug>(go-run-tab)', '[G]o [R]un [T]ab')
        nmap('<Leader>grs', '<Plug>(go-run-split)', '[G]o [R]un [S]plit')
        nmap('<Leader>grv', '<Plug>(go-run-vertical)', '[G]o [R]un [V]ertical')
        nmap('<Leader>gi', '<Plug>(go-install)', '[G]o [I]nstall')
        nmap('<Leader>gg', '<Plug>(go-generate)', '[G]o [G]enerate')
        nmap('<Leader>gt', '<Plug>(go-test)', '[G]o [T]est')
        nmap('<Leader>gtf', '<Plug>(go-test-func)', '[G]o [T]est [F]unc')
        nmap('<Leader>gc', '<Plug>(go-coverage-toggle)', '[G]o [C]overage Toggle')
        nmap('<Leader>gl', '<Plug>(go-lint)', '[G]o [L]int')
        nmap('<Leader>gv', '<Plug>(go-vet)', '[G]o [V]et')
        nmap('<Leader>ge', '<Plug>(go-rename)', '[G]o R[e]name')
        nmap('<Leader>gsdx', '<Plug>(go-def)', '[G]o [S]how [D]ef')
        nmap('<Leader>gdd', '<Plug>(go-decls-dir)', '[G]o [D]ecls [D]ir')
        nmap('<Leader>gds', '<Plug>(go-def-split)', '[G]o [D]ef [S]plit')
        nmap('<Leader>gdv', '<Plug>(go-def-vertical)', '[G]o [D]ef [V]ertical')
        nmap('<Leader>gdt', '<Plug>(go-def-tab)', '[G]o [D]ef [T]ab')
        nmap('<Leader>gm', '<Plug>(go-metalinter)', '[G]o [M]etalinter')
        nmap('<Leader>gfv', '<Plug>(go-freevars)', '[G]o [F]ree [V]ars')
    end
})
