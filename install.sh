 #!/bin/sh

 set -e
 set -u

 setup() {
     dotfiles=$HOME/.ghq/github.com/kseta/dotfiles

     has() {
         type "$1" > /dev/null 2>&1
     }

     symlink() {
         [ -e "$2" ] || ln -s "$1" "$2"
     }

     if [ -d "$dotfiles" ]; then
         (cd "$dotfiles" && git pull --rebase)
     else
         git clone https://github.com/kseta/dotfiles "$dotfiles"
     fi

     has git && symlink "$dotfiles/home/.gitconfig" "$HOME/.gitconfig"
     has git && symlink "$dotfiles/home/.zshrc" "$HOME/.zshenv"
     has git && symlink "$dotfiles/home/.zshrc" "$HOME/.zshrc"
     has vim && symlink "$dotfiles/home/.vimrc" "$HOME/.vimrc"
 }

 setup
