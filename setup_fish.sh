#!/usr/bin/env fish

echo "\n<<< Starting Fishshell Setup >>>\n"

# Fisher インストール
if [ -e ~/.config/fish/functions/fisher.fish ]
    echo "fisher has already installed"
else
    curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
end

# プラグインインストール
fisher install jethrokuan/z
fisher install PatrickF1/fzf.fish
