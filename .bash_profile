#check dotfiles
if [ ! -d $HOME/dotfiles_private ]; then
  git clone git@bitbucket.org:keitaoouchi/dotfiles_private.git
fi
if [ ! -d $HOME/dotfiles_public ]; then
  git clone git@github.com:keitaoouchi/dotfiles_public.git
fi
# create symbolic link if not exists.
for i in $( ls -a $HOME/dotfiles_private ); do
  if [[ ! -e $HOME/$i ]] && [[ ! $i =~ ^.(.|git|gitignore)?$ ]]; then
    ln -s $HOME/dotfiles_private/$i $HOME/$i
  fi
done
for i in $( ls -a $HOME/dotfiles_public ); do
  if [[ ! -e $HOME/$i ]] && [[ ! $i =~ ^.(.|git|gitignore)?$ ]]; then
    ln -s $HOME/dotfiles_public/$i $HOME/$i
  fi
done

MYLIB=$HOME/libraries
JAVA_HOME=/Library/Java/JavaVirtualMachines/JDK7/Contents/Home
SCALA_VERSION="2.9"
SCALA_HOME=$MYLIB/scala/$SCALA_VERSION
PLAY_HOME=$MYLIB/frameworks/play
JARHOME=$MYLIB/lib
CLASSPATH=$SCALA_HOME/lib:$JARHOME:
RSENSE_HOME=$MYLIB/rsense

#import my libraries from bitbucket's private repository
bash .resolve_dependencies

#assemble PATH
PATH=/usr/local/bin:/usr/local/sbin:$PATH
if [ -d $JAVA_HOME ]; then
    PATH=$JAVA_HOME/bin:$PATH
fi
if [ -d $MYLIB/scripts/utils ]; then
    PATH=$MYLIB/scripts/utils:$PATH
fi
PATH=$SCALA_HOME/bin:$PLAY_HOME:$RSENSE_HOME/bin:$PATH

#export java related
export JAVA_HOME
export SCALA_HOME
export CLASSPATH
export RSENSE_HOME
#export paths
export PATH
#mercurial encoding
export HGENCODING=UTF-8
#set pip to use mirrors
export PIP_USE_MIRRORS=true

#import aliases
[[ -f .alias_public ]] && . .alias_public
[[ -f .alias_private ]] && . .alias_private

#limit core dump size
ulimit -c 0

#settings for pythonz
[[ -s "$HOME/.pythonz/etc/bashrc" ]] && source "$HOME/.pythonz/etc/bashrc"

#settings for rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#settings for nvm
[[  -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"

#settings for homebew's bash_completion
if [ `which brew 2> /dev/null` ] && [  -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

#settings for phpbrew
[[ -s "$HOME/.phpbrew/bashrc" ]] && source "$HOME/.phpbrew/bashrc"

#enable to execute eclipse from terminal
[[ -f $HOME/eclipse/eclipse ]] && alias eclipse=$HOME/eclipse/eclipse

