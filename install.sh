#!/usr/bin/env bash

get_host_os() {
    if [ "$(uname)" == "Darwin" ]; then
        # Mac OS X platform        
        echo "MAC"
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        # GNU/Linux platform
        echo "LINUX"
    elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
        # 32 bits Windows NT platform
        echo "WIN32"
    elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
        # 64 bits Windows NT platform
        echo "WIN64"
    fi
}

brew_install() {
    echo "Checking for $1 installation..."

    if hash $1 2>/dev/null; then
        echo "$2 already installed..."
    else
        echo "$2 is not installed. Installing..."
        brew install $2
    fi
}

HOST_OS="$(get_host_os)"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

install_conda() {
    echo "Checking for conda installation..."

    if hash conda 2>/dev/null; then
        echo "conda already installed..."
    else
        echo "conda is not installed. Installing..."
        if [ $HOST_OS == "MAC" ]; then
            curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh > miniconda_installer.sh
        elif [ $HOST_OS == "LINUX" ]; then
            curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh > miniconda_installer.sh
        fi

        sh miniconda_installer.sh
        rm miniconda_installer.sh
    fi
}

setup_tmux() {
    if [ -f $HOME/.tmux.conf ]; then
        echo "$HOME/.tumx.conf already exists. Skipping tmux setup..."
    else
        # Install tpm- Tmux Plugin Manager
        git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
        ln -s $DIR/tmux/tmux.conf $HOME/.tmux.conf

        # Install tpm plugins
        sh $HOME/.tmux/plugins/tpm/bin/install_plugins
    fi
}

setup_neovim() {
    if [[ ! -d $HOME/.config/nvim && ! -L $HOME/.config/nvim ]]; then
        ln -s nvim $HOME/.config/nvim
        echo "This file too not found"
    fi

    mkdir -p $HOME/.config/nvim/tmp

    if hash pip3 2>/dev/null; then
        pip3 install neovim > /dev/null
    fi

    if hash pip2 2>/dev/null; then
        pip2 install neovim > /dev/null
    fi

    if [[ ! -d $HOME/.config/nvim/bundle/repos/github.com/Shougo/dein.vim &&
         ! -L $HOME/.config/nvim/bundle/repos/github.com/Shougo/dein.vim ]]; then
        # Install dein - dark powered plugin manager for neovim
        curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh
        sh dein_installer.sh $HOME/.config/nvim/bundle
        rm dein_installer.sh
    fi
}

setup_fzf() {
    /usr/local/opt/fzf/install
}

setup_bash() {
    echo "TODO: Pending bash setup"
    # Install Poweline Fonts
    git clone https://github.com/powerline/fonts.git
    cd fonts
    sh install.sh
    echo "Change the font to Meslo LG M DZ Regular in terminal app to be able to use powerline fonts..."
}

case $HOST_OS in
    "MAC")
        echo "Starting installation on OSX..."
        brew_install git git
        brew_install tmux tmux
        brew_install nvim neovim
        brew_install ripgrep ripgrep
        brew_install fzf fzf
        brew_install tree tree
        brew_install bat bat
        install_conda
        setup_tmux
        setup_neovim
        setup_fzf
        setup_bash
        ;;

    "LINUX")
        echo "Starting installation on LINUX ..."
        ;;
    *)
        echo "This platform in currently not supported.."
        ;;
esac