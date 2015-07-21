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
    jq
    mysql
    tmux
    bash
    narwhal
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
    node
    p7zip
    pigz
    pv
    rename
    rhino
    sqlmap
    tree
    ucspi-tcp # `tcpserver` et al.
    webkit2png
    xpdf
    zopfli
    homebrew/versions/lua52
    caskroom/cask/brew-cask
    rbenv ruby-build
    "git bash-completion"
    htop
    git-flow
    bash-git-prompt
)

CASKS=(
     slack
     karabiner
     evernote
     brogue
     mailbox
     dropbox
     google-chrome
     postgres
     shiftit
     node
     flux
     virtualbox
     vagrant
     rdio
     textexpander
     hipchat
     android-studio
     skitch
     atom
     dashlane
)


function setup() {
    [ -x "/usr/local/bin/brew" ] || {
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    }
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