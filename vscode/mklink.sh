#!/bin/bash
set -x
cwd=$(pwd)
cd "$HOME/Library/Application Support/Code/User/"
mv -f settings.json settings.json.bak
mv -f keybindings.json keybindings.json
ln -sf "$HOME/sys/vscode/settings.json" .
ln -sf "$HOME/sys/vscode/keybindings.json" .
cd "$cwd"
