function shw_setup() {
  echo "Installing Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /dev/null
  echo "Doctor, update"
  brew update > /dev/null
  brew doctor > /dev/null

  echo "Tapping cask"
  brew tap caskroom/cask > /dev/null

  echo "Installing node"
  brew install node > /dev/null

  echo "Installing QuickLook plugins"
  brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize suspicious-package quicklookase > /dev/null
}
