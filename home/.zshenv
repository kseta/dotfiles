# /etc/profile を読み込まない
setopt no_global_rcs

# ------------------------------
# golang Settings
# ------------------------------
export GOPATH=$HOME/go

# ------------------------------
# PATH Settings
# ------------------------------
export PATH="/usr/local/bin:$PATH"
# see: http://qiita.com/halo57/items/e7511f3befbcb9fedd6a
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$PATH:/usr/local/opt/go/libexec/bin"
export PATH="$PATH:$GOPATH/bin"

# ------------------------------
# Z Settings
# ------------------------------
if which brew > /dev/null; then
  _Z_CMD=j
  source $(brew --prefix)/etc/profile.d/z.sh
fi

# ------------------------------
# PhpBrew Settings
# ------------------------------
export PHPBREW_SET_PROMPT=1
[[ -s "$HOME/.phpbrew/bashrc" ]] && source "$HOME/.phpbrew/bashrc"
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig

# ------------------------------
# rbenv Settings
# ------------------------------
export PATH="$HOME/.rbenv/shims:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# ------------------------------
# pyenv-virtualenv Settings
# ------------------------------
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/s-keigou/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/s-keigou/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/s-keigou/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/s-keigou/google-cloud-sdk/completion.zsh.inc'; fi
