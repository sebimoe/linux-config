#!/bin/bash

PKGINSTALL="apt install -y"

$PKGINSTALL curl zsh git

export RUNZSH=no

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

FAIL=1
if [[ $? == 1 ]]; then
  FAIL=1
fi

if [ ! -d ~/.oh-my-zsh ]; then
  echo "Oh my zsh could not be installed."
  exit 1
fi

if [ ! -f ~/.zshrc ]; then
  echo .zshrc not found.
  exit 1
fi


git clone https://github.com/supercrabtree/k ~/.oh-my-zsh/custom/plugins/k

sed -i 's/^ZSH_THEME=.*$/ZSH_THEME="gnzh"/g' ~/.zshrc

PLUGINS=

for PLUGIN in screen colorize colored-man-pages extract web-search k
do
  FOUND=$(grep "^plugins=.*$PLUGIN." ~/.zshrc)
  if [[ "$FOUND" == "" ]]; then
    PLUGINS="$PLUGIN $PLUGINS"
  fi
done

sed -i "s/^plugins=./plugins=($PLUGINS/g" ~/.zshrc


echo

if [[ "$FAIL" == "1" ]]; then
  echo "Oh my zsh already installed, proceeding with plugin installation. If you have custom plugin configuration, you will need to edit it manually."
else
  echo "Oh my zsh installed."
fi

echo "Use zsh to use zsh. Enabled plugins:"

grep '^plugins=' ~/.zshrc
