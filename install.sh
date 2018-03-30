#! /bin/sh
# Ensure this file is idempotent!

set -x
:
: profile
:
ln -sf ~/.dotfiles/.bashrc ~/.bashrc
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf

:
: bins
:
mkdir -p ~/bin
ln -sf ~/.dotfiles/scripts/git-uncommit.sh ~/bin/git-uncommit
ln -sf ~/.dotfiles/scripts/git-thank.sh ~/bin/git-thank
ln -sf ~/.dotfiles/scripts/grit-attackclone.sh ~/bin/git-attackclone
ln -sf ~/.dotfiles/.status ~/bin/status

:
: program settings
:
# Hyperterm settings
ln -sf ~/.dotfiles/.hyper.js ~/.hyper.js

case $(uname) in
  Darwin)
    # VS Code settings
    ln -sf ~/.dotfiles/.code.settings.json ~/Library/Application\ Support/Code/User/settings.json
    deps=(
      coreutils
      reattach-to-user-namespace # see see https://github.com/Microsoft/vscode/issues/12587#issuecomment-280681178
    )
    brew install ${deps[*]}
    brew upgrade ${deps[*]}
    ;;
  Linux)
    ;;
esac

:
: installing some other tools
:
deps=(
  npx
  git-recent # https://github.com/paulirish/git-recent/
)
npm install --global ${deps[*]}

:
:installing fonts
:
# check if exists in local fonts, else
curl https://raw.githubusercontent.com/adobe-fonts/source-code-pro/release/OTF/SourceCodePro-Regular.otf  > ~/Library/Fonts/SourceCodePro-Regular.otf

:
: setup ok
:
