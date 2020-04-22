" CtrlP
" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>u :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

" fzf
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
nnoremap <Leader>p :Files<CR>

" deoplete
let g:deoplete#enable_at_startup = 1
" let g:deoplete#auto_completion_start_length = 1

" deoplete-go
let g:deoplete#sources#go#align_class = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1

" deoplete-clang
let g:deoplete#sources#clang#libclang_path = "/Library/Developer/CommandLineTools/usr/lib/libclang.dylib"
let g:deoplete#sources#clang#clang_header = "/Library/Developer/CommandLineTools/usr/lib/clang"
let g:deoplete#sources#clang#flags = [
      \ "-cc1",
      \ "-triple", "x86_64-apple-macosx10.11.0",
      \ "-isysroot", "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk",
      \ "-fmax-type-align=16",
      \ ]

" git gutter
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" neosnippet.vim
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
 smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

let g:deoplete#enable_at_startup = 1
" if !exists('g:deoplete#omni#input_patterns')
"   let g:deoplete#omni#input_patterns = {}
" endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" deoplete tab-complete
" inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
" ,<Tab> for regular tab
" inoremap <Leader><Tab> <Space><Space>
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" tern
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete

" esformatter
" will run esformatter after pressing <leader> followed by the 'e' and 's' keys
nnoremap <silent> <leader>es :Esformatter<CR>
vnoremap <silent> <leader>es :EsformatterVisual<CR>

" HTML
let g:syntastic_html_validator_parser = 'html5'

" Asciidoc
" au FileType asciidoc autocmd! BufWritePost * call jobstart(["asciidoctor", "-r", "asciidoctor-diagram", @%])

" FZF
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" vim-go
let g:go_fmt_command = "goimports"
let g:syntastic_auto_loc_list = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_auto_type_info = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_experimental = 1
let g:go_rename_command = 'gopls'
" let g:go_auto_sameids = 1
let g:go_list_type = "locationlist"
" let g:go_term_enabled = 1
" let g:go_term_mode = "split"
" au FileType go autocmd! BufWritePost * GoBuild
au FileType go nmap <silent> ,, <Plug>(go-sameids-toggle)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>gce <Plug>(go-callees)
au FileType go nmap <Leader>gcr <Plug>(go-callers)
au FileType go nmap <Leader>grr <Plug>(go-referrers)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>i <Plug>(go-install)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <Leader>dx <Plug>(go-def)
au FileType go nmap <Leader>dd <Plug>(go-decls-dir)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>rt <Plug>(go-run-tab)
au FileType go nmap <Leader>rs <Plug>(go-run-split)
au FileType go nmap <Leader>rv <Plug>(go-run-vertical)
au FileType go nmap <Leader>m <Plug>(go-metalinter)
" vim-go can be an Asshole, too, just like App Engine
let g:go_autodetect_gopath = 0
" don't touch my asm, asshole vim-go/asmfmt
let g:go_asmfmt_autosave = 0

" Welcome to Vim Airlines!
let g:airline_theme="gruvbox"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9


" Silly SignColumn
highlight clear SignColumn

" highlight clear SignColumn
call gitgutter#highlight#define_highlights()

let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"

" C++
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_cpp_compiler_options = '-std=c++14'
