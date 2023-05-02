#!/bin/bash

DATA_PATH=`echo "redir>>/dev/stdout | echo stdpath('data')" | nvim -es | xargs`

PACK_DIR="$DATA_PATH/site/pack/skriptble"

START_DIR=$PACK_DIR/start
OPT_DIR=$PACK_DIR/opt

function clone() {
    local "${@:3}"
    local tag
    dir=""
    branch=""
    if [ $1 = "start" ]; then
        dir=$START_DIR
    elif [ $1 = "opt" ]; then
        dir=$OPT_DIR
    elif [ $1 = "fzf" ]; then
        dir=$HOME
    else
        echo "unknown dir option passed to clone: $1"
        exit 1
    fi

    plugin=$2
    dirname=`echo $plugin | sed 's/.*\///'`
    if [ $1 = "fzf" ]; then
        dirname=".fzf"
    fi
    if [ ! -z "$tag" ]; then
        branch=" --branch $tag "
    else
        tag="main"
    fi

    # We use run to prefix the output.
    function run {
        local CMD=("$@")
        ${CMD[@]} 1> >(sed "s/^/${dirname}: /") 2> >(sed "s/^/${dirname}: /" 1>&2)
    }

    if [ ! -d "$dir/$dirname" ]; then
        echo "Cloning $plugin@$tag into $dirname"
        run git clone --depth 1 $branch https://github.com/$plugin $dir/$dirname
    elif [ $tag != "main" ]; then
        echo "$dirname exists, updating to tag $tag"
        run git -C $dir/$dirname checkout $tag
    else
        echo "$dirname exists, updating to head of branch"
        run git -C $dir/$dirname pull
    fi
}

clone start "Raimondi/delimitMate"
clone start "fatih/vim-go" tag="v1.24"
clone start "tpope/vim-abolish"
clone start "vim-airline/vim-airline"
clone start "tpope/vim-fugitive"
clone start "airblade/vim-gitgutter"
clone start "tpope/vim-repeat"
clone start "tpope/vim-speeddating"
clone start "tpope/vim-surround"
clone start "bronson/vim-trailing-whitespace"
clone start "junegunn/fzf.vim"
clone start "kristijanhusak/vim-hybrid-material"
clone start "vim-airline/vim-airline-themes"
clone start "Yggdroot/indentLine"
clone start "hrsh7th/nvim-cmp"
clone start "nvim-treesitter/nvim-treesitter"
clone start "nvim-treesitter/nvim-treesitter-context"
clone start "numToStr/Comment.nvim"
clone start "liuchengxu/vista.vim"

# fzf
# we need to run the install script for fzf
clone fzf "junegunn/fzf"
$HOME/.fzf/install --all
ln -sfh $HOME/.fzf $START_DIR/fzf
