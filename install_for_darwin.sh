# author: Takatsugu Yoneya
# 2018-6-6

# Homebrew install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install modules
brew update
brew install coreutils
brew install cowsay
brew install go
brew install peco
brew install reattach-to-user-namespace
brew install tmux
brew install tree
brew install zsh
brew install the_shilver_searcher

echo Start make vim libraly

home=$HOME
# .vimディレクトリをカレントに作成
cd $HOME
mkdir .vim
mkdir .zsh
cd .vim
mkdir colors
mkdir dein

# vim library
Github="https://github.com"
cd ~/.vim/colors
git clone "$Github/tomasr/molokai"
git clone "$Github/w0ng/vim-hybrid"
mv molokai/colors/molokai.vim molokai.vim
mv vim-hybrid/colors/hybrid.vim hybrid.vim
cd ~/.vim/dein
git clone "$Github/Shougo/dein.vim"
rm -rf molokai
rm -rf vim-hybrid
echo DONE!!

# zsh library
echo Start make zsh library
cd ~/.zsh/
git clone "$Github/b4b4r07/zsh-vimode-visual"
echo DONE!!

echo Start make tmux library
cd $HOME
mkdir .tmux
cd .tmux
git clone "$Github/tmux-plugin/tmp ~/.tmux/plugins/tpm"
echo DONE!!

echo Start make Symlinks at HOME

# peco dir
echo Start make peco config
cd $HOME
mkdir .peco
cd $HOME
echo DONE!!

# シムリンクを作成する
cd $HOME
ln -sf $HOME/dotfiles/git/_gitconfig .gitconfig
ln -sf $HOME/dotfiles/_tmux_conf .tmux.conf
ln -sf $HOME/dotfiles/peco/config.json .peco/config.json
ln -sf $HOME/dotfiles/_vimrc .vimrc
ln -sf $HOME/dotfiles/_zprofile .zprofile
ln -sf $HOME/dotfiles/_zshrc .zshrc
cp ~/dotfiles/_zshenv ~/.zshenv
cp ~/dotfiles/_netrc ~/.netrc
cp ~/dotfiles/git/_gitconfig_privacy ~/.gitconfig.privacy

echo DONE!!
