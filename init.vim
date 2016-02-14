call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'Raimondi/delimitMate'
Plug 'nsf/gocode'
Plug 'fatih/vim-go'
Plug 'morhetz/gruvbox'
Plug 'ervandew/supertab'
Plug 'benekastah/neomake'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'tomtom/tcomment_vim'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-abolish'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rodjek/vim-puppet'
Plug 'tpope/vim-repeat'
Plug 'honza/vim-snippets'
Plug 'rstacruz/sparkup'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

set laststatus=2
syntax enable
" let g:Powerline_theme="skwp"
" let g:Powerline_colorscheme="skwp"
" let g:Powerline_symbols = 'fancy'
set background=dark
let g:gruvbox_sign_column='dark0'
let g:gruvbox_invert_selection=0
let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox
set pastetoggle=<F2>

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.

set hidden
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set copyindent
set hlsearch
set smartcase
set ignorecase
set smartindent
set number
set backspace=indent,eol,start
set incsearch
set wrap

set undolevels=1000      " use many muchos levels of undo
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set modeline            " Enable modeline.
set esckeys             " Cursor keys in insert mode.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.

filetype indent plugin on

let mapleader = "\<SPACE>"
let g:EasyMotion_leader_key = '<Leader>m'

" Let's use a semi colon instead of colon
nnoremap ; :
nmap <F8> :TagbarToggle<CR>

" Easy window navigation
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Quick Escape!
inoremap jk <esc>

" Stop cursor from jumping over wrapped lines
nnoremap j gj
nnoremap k gk

" Clear those searches!
nmap <silent> ,/ :nohlsearch<CR>

" For when I forgot to sudo
cmap w!! w !sudo tee % >/dev/null

" Danger, Will Robinson
" You've disabled your arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Go stuff
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_auto_type_info = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_experimental = 1
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_term_enabled = 1
let g:go_term_mode = "split"
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>gce <Plug>(go-callees)
au FileType go nmap <Leader>gcr <Plug>(go-callers)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>i <Plug>(go-install)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <Leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>dx <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>rt <Plug>(go-run-tab)
au FileType go nmap <Leader>rs <Plug>(go-run-split)
au FileType go nmap <Leader>rv <Plug>(go-run-vertical)
" vim-go can be an Asshole, too, just like App Engine
let g:go_autodetect_gopath = 0

let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"

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

" autocmd vimenter * NERDTree
autocmd insertenter * set nornu
autocmd insertleave * set rnu
autocmd vimenter * set rnu

" Silly SignColumn
highlight clear SignColumn

" highlight clear SignColumn
call gitgutter#highlight#define_highlights()

" True colors!
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

tnoremap jk <C-\><C-n>

" Give the NeoVim Terminal some color!
let g:terminal_color_0="#282828"
let g:terminal_color_1="#cc241d"
let g:terminal_color_2="#98971a"
let g:terminal_color_3="#d79921"
let g:terminal_color_4="#458588"
let g:terminal_color_5="#b16286"
let g:terminal_color_6="#689d6a"
let g:terminal_color_7="#a89984"
let g:terminal_color_8="#928374"
let g:terminal_color_9="#fb4934"
let g:terminal_color_10="#b8bb26"
let g:terminal_color_11="#fabd2f"
let g:terminal_color_12="#83a598"
let g:terminal_color_13="#d3869b"
let g:terminal_color_14="#8ec07c"
let g:terminal_color_15="#ebdbb2"

" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>u :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>
