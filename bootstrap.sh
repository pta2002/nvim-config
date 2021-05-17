#!/usr/bin/env bash
# We need a way to bootstrap the install, since we won't have aniseed available at the start
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

git clone https://github.com/Olical/aniseed\
 ~/.local/share/nvim/site/pack/packer/start/aniseed

git clone https://github.com/tsbohc/zest.nvim\
 ~/.local/share/nvim/site/pack/packer/start/zest.nvim
