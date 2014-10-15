#!/bin/sh

PATH=/usr/local/bin:$PATH

TAPS=(
    homebrew/binary
    homebrew/dupes
    homebrew/versions
    homebrew/science
    josegonzalez/php
)

FORMULAS=(
    ringojs
		narwhal
		"vim --override-system-vi"
		homebrew/dupes/grep
		homebrew/dupes/screen
		"homebrew/php/php55 --with-gmp"
		ack
		bfg
		foremost
		git
		hashpump
		"imagemagick --with-webp"
		lynx
		nmap
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
		exercism
)

CASKS=(
     dropbox 
		 google-chrome 
		 google-chrome-canary 
		 textmate 
		 postgres 
		 shiftit 
		 node 
		 dash 
		 alfred
		 caffeine
		 flux
		 virtualbox
		 vagrant
		 phpstorm
		 sequel-pro
		 adium
		 nvalt
		 rdio
		 slack
		 textexpander
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