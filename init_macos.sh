#!/bin/bash

#=============================================================================
# macOS Setup Script
#=============================================================================

#-----------------------------------------------------------------------------
# 1. HOMEBREW SETUP
#-----------------------------------------------------------------------------

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to PATH (Apple Silicon)
eval "$(/opt/homebrew/bin/brew shellenv)"

#-----------------------------------------------------------------------------
# 2. APP INSTALLATIONS (Homebrew Casks)
#-----------------------------------------------------------------------------

# Browsers
brew install --cask google-chrome
brew install --cask tor-browser

# Communication
brew install --cask telegram

# Productivity
brew install --cask rectangle
brew install --cask raycast
brew install --cask chatgpt

# Development
brew install --cask docker
brew install --cask intellij-idea
brew install --cask visual-studio-code
brew install --cask sublime-text
brew install --cask cursor
brew install --cask postman

# Media
brew install --cask spotify
brew install --cask vlc

# Utilities
brew install --cask logi-options+
brew install dockutil

#-----------------------------------------------------------------------------
# 3. CLI TOOLS & DEV ENVIRONMENT
#-----------------------------------------------------------------------------

# Node.js
brew install node

# Python (pyenv)
brew install pyenv

# SDKMAN & Java
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 21.0.9-amzn
sdk install java 17.0.13-amzn

#-----------------------------------------------------------------------------
# 4. SHELL CONFIGURATION
#-----------------------------------------------------------------------------

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install zsh-syntax-highlighting
brew install zsh-syntax-highlighting

# Symlink .zshrc to bcs_settings
rm ~/.zshrc
ln -s ~/bcs_settings/zshrc ~/.zshrc

#-----------------------------------------------------------------------------
# 5. GIT CONFIGURATION
#-----------------------------------------------------------------------------

git config --global user.email "bsefercik@gmail.com"
git config --global user.name "Bugra Sefercik"

#-----------------------------------------------------------------------------
# 6. macOS SYSTEM PREFERENCES
#-----------------------------------------------------------------------------

# Dock settings
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock orientation -string "left"
defaults write com.apple.dock tilesize -int 36
defaults write com.apple.dock magnification -bool false
defaults write com.apple.dock mineffect -string "genie"
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock launchanim -bool true
defaults write com.apple.dock show-process-indicators -bool true
defaults write com.apple.dock show-recents -bool true
defaults write NSGlobalDomain AppleActionOnDoubleClick -string "Maximize"

# Menu bar clock settings
defaults write com.apple.menuextra.clock ShowDate -int 1
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool true
defaults write com.apple.menuextra.clock IsAnalog -bool false
defaults write com.apple.menuextra.clock ShowAMPM -bool false
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false
defaults write com.apple.menuextra.clock ShowSeconds -bool true

# Battery menu bar settings
defaults write com.apple.menuextra.battery ShowPercent -bool true

# Control Center / Menu Bar settings
defaults write com.apple.Siri StatusMenuVisible -bool false
defaults write com.apple.Spotlight MenuItemHidden -bool true
defaults write com.apple.controlcenter "NSStatusItem Visible WiFi" -bool true
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true
defaults write com.apple.controlcenter "NSStatusItem Visible Battery" -bool true
defaults write com.apple.controlcenter "NSStatusItem Visible UserSwitcher" -bool false

# Keyboard shortcuts: Switch to Desktop 1 (Ctrl+1) and Desktop 2 (Ctrl+2)
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 118 "{ enabled = 1; value = { parameters = (49, 18, 262144); type = standard; }; }"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 119 "{ enabled = 1; value = { parameters = (50, 19, 262144); type = standard; }; }"
killall cfprefsd

#-----------------------------------------------------------------------------
# 7. DOCK MANAGEMENT (requires dockutil)
#-----------------------------------------------------------------------------

# Remove unwanted apps from Dock
dockutil --remove "Photos" --no-restart
dockutil --remove "Maps" --no-restart
dockutil --remove "FaceTime" --no-restart
dockutil --remove "Messages" --no-restart
dockutil --remove "Games" --no-restart
dockutil --remove "Phone" --no-restart
dockutil --remove "Mail" --no-restart
dockutil --remove "Contacts" --no-restart
dockutil --remove "Safari" --no-restart
dockutil --remove "TV" --no-restart
dockutil --remove "Reminders" --no-restart
dockutil --remove "Notes" --no-restart
dockutil --remove "Music" --no-restart
dockutil --remove "Keynote" --no-restart
dockutil --remove "Numbers" --no-restart
dockutil --remove "Pages" --no-restart
dockutil --remove "App Store" --no-restart
dockutil --remove "iPhone Mirroring" --no-restart
dockutil --remove "System Settings" --no-restart

# Add apps to Dock with explicit positions
dockutil --add "/Applications/Google Chrome.app" --position 1 --no-restart
dockutil --add "/Applications/Microsoft Teams.app" --position 2 --no-restart
dockutil --add "/Applications/Calendar.app" --position 3 --no-restart
dockutil --add "/Applications/Cursor.app" --position 4 --no-restart
dockutil --add "/Applications/IntelliJ IDEA.app" --position 5 --no-restart
dockutil --add "/Applications/Spotify.app" --position 6 --no-restart
dockutil --add "/System/Applications/Utilities/Terminal.app" --position 7 --no-restart
dockutil --add "/Applications/ChatGPT.app" --position 8 --no-restart

# Apply Dock changes
killall Dock
