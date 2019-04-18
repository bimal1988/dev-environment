" ===========================================================
" ===    Scripts relevant to the dein plugin manager      ===    
" ===    Has to run first in order to set the runtime     ===
" ===========================================================

if &compatible
    set nocompatible               " Be iMproved
endif


" Required: Add the dein installation directory into runtimepath
set runtimepath+=~/.config/nvim/bundle/repos/github.com/Shougo/dein.vim


if dein#load_state('~/.config/nvim/bundle')
    call dein#begin('~/.config/nvim/bundle')

    " Let dein manage dein
    call dein#add('~/.config/nvim/bundle')
    call dein#add('Shougo/dein.vim')

    " Add or remove your plugins here:
    " Colorschemes
    call dein#add('icymind/neosolarized')
    call dein#add('joshdick/onedark.vim')
    call dein#add('morhetz/gruvbox')

    " Show colors in CSS
    call dein#add('ap/vim-css-color')
    
    " Physics-based smooth motion in Vim
    call dein#add('yuttie/comfortable-motion.vim')

    " Statusline
    call dein#add('itchyny/lightline.vim')
    call dein#add('maximbaz/lightline-ale')
    
    " Fuzzy finder
    call dein#add('/usr/local/opt/fzf')
    call dein#add('junegunn/fzf.vim')

    " Navigate files in sidebar
    call dein#add('scrooloose/nerdtree')
    call dein#add('xuyuanp/nerdtree-git-plugin')

    " Asynchronous linting
    call dein#add('w0rp/ale')

    " Asynchronous autocompletion
    call dein#add('Shougo/deoplete.nvim')
    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif
    call dein#add('zchee/deoplete-clang')
    call dein#add('zchee/deoplete-jedi')
    call dein#add('carlitux/deoplete-ternjs')
    call dein#add('steelsojka/deoplete-flow')

    " Code snippets
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')

    " Git support
    call dein#add('tpope/vim-fugitive')
    call dein#add('airblade/vim-gitgutter')

    " Code-folding, Commenting and Quoting
    call dein#add('Konfekt/FastFold')
    call dein#add('tpope/vim-commentary')
    call dein#add('tpope/vim-surround')

    " CTag generation and tagbar navigation
    call dein#add('craigemery/vim-autotag')
    call dein#add('majutsushi/tagbar')

    " Tmux integration
    call dein#add('christoomey/vim-tmux-navigator')
    call dein#add('benmills/vimux')

    call dein#end()
    call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif
