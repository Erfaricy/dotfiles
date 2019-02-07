#!/bin/sh

PATH=/usr/local/bin:$PATH

TAPS=(
    homebrew/binary
    homebrew/dupes
    homebrew/versions
    homebrew/science
    josegonzalez/php
    homebrew/games
)

FORMULAS=(
    mongodb
    jq
    mysql
    tmux
    bash
    chromedriver
    "vim --override-system-vi"
    homebrew/dupes/grep
    homebrew/dupes/screen
    "homebrew/php/php55 --with-gmp"
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
    caskroom/cask/brew-cask
    rbenv ruby-build
    "git bash-completion"
    htop
    git-flow
    bash-git-prompt
    ffmpeg
)

CASKS=(
     slack
     brogue
     dropbox
     spectacle
     google-chrome
     postgres
     dashlane
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

function install_caskfiles() {
    for cask in "${CASKS[@]}"; do
        brew cask install $cask
    done
}

function main() {
    setup

    brew update
    brew upgrade

    install_brewfiles
    install_caskfiles

    brew linkapps --local
    brew cleanup
    brew doctor
    brew prune
}

main