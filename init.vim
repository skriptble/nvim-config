call plug#begin()
Plug 'scrooloose/nerdtree'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'Raimondi/delimitMate'
Plug 'fatih/vim-go', { 'tag': 'v1.23' }
Plug 'morhetz/gruvbox'
Plug 'benekastah/neomake'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'tomtom/tcomment_vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
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
Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs'
Plug 'zchee/deoplete-clang'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install'}
" Plug 'dbgx/lldb.nvim'
Plug 'millermedeiros/vim-esformatter'
Plug 'b4b4r07/vim-hcl'
Plug 'mattn/emmet-vim'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'tpope/vim-fireplace'
Plug 'vim-scripts/paredit.vim'
Plug 'venantius/vim-eastwood'
Plug 'venantius/vim-cljfmt'
Plug 'tpope/vim-salve'
Plug 'guns/vim-clojure-static'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'guns/vim-clojure-highlight'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'fishbullet/deoplete-ruby'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'rakr/vim-one'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'vim-airline/vim-airline-themes'
Plug 'rhysd/vim-color-spring-night'
Plug 'racer-rust/vim-racer'
Plug 'mattn/webapi-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript'
Plug 'Shougo/echodoc.vim'
Plug 'Yggdroot/indentLine'
call plug#end()

source $HOME/.config/nvim/config/defaults.vim
source $HOME/.config/nvim/config/plugins.vim
source $HOME/.config/nvim/config/lvsthw.vim

" let g:python_host_prog = '/System/Library/Frameworks/Python.framework/Versions/2.7/bin/python'
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

autocmd insertenter * set nornu
autocmd insertleave * set rnu
autocmd vimenter * set rnu
autocmd vimenter * setlocal spell

" True colors!
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
 set termguicolors
endif

echo ">^.^<"
