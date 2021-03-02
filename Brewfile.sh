#!/bin/sh

PATH=/usr/local/bin:$PATH


FORMULAS=(
    jq
    mysql
    tmux
    bash
    "vim --override-system-vi"
    ack
    git
    "imagemagick --with-webp"
    lynx
    nmap
    markdown
    p7zip
    pigz
    pv
    rename
    sqlmap
    tree
    rbenv ruby-build
    "git bash-completion"
    htop
    git-flow
    bash-git-prompt
    ffmpeg
    github/gh/gh
    pyenv
    node

    slack
    alfred
    brogue
    spectacle
    google-chrome
    postgres
    dashlane
    visual-studio-code
)


function setup() {
    [ -x "/usr/local/bin/brew" ] || {
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    }
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

function install_brewfiles() {
    for tap in "${TAPS[@]}"; do
        brew tap $tap
    done

    for formula in "${FORMULAS[@]}"; do
        brew install $formula
    done
}


function main() {
    setup

    brew update
    brew upgrade

    install_brewfiles

    brew linkapps --local
    brew cleanup
    brew doctor
    brew prune
}

main
