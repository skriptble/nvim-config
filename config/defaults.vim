set laststatus=2
syntax enable
set background=dark
let g:gruvbox_sign_column='dark0'
let g:gruvbox_invert_selection=0
let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox

let mapleader = "\<SPACE>"
let maplocalleader = ","

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

let g:EasyMotion_leader_key = '<Leader>m'

" Let's use a semi colon instead of colon
nnoremap ; :
nmap <F8> :TagbarToggle<CR>

" Easy window navigation
" tnoremap <C-h> <C-\><C-n><C-w>h
" tnoremap <C-j> <C-\><C-n><C-w>j
" tnoremap <C-k> <C-\><C-n><C-w>k
" tnoremap <C-l> <C-\><C-n><C-w>l
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Quick Escape!
inoremap jk <esc>

" Stop cursor from jumping over wrapped lines
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$
nnoremap gj j
nnoremap gk k
nnoremap g0 0
nnoremap g$ $

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

" Remap jk to exit terminal
tnoremap jk <C-\><C-n>

" Edit init.vim super easy
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" and sourcing it is too!
nnoremap <leader>sv :source $MYVIMRC<cr>

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
