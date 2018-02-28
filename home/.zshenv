# /etc/profile を読み込まない
setopt no_global_rcs

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
