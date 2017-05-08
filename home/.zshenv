# /etc/profile を読み込まない
setopt no_global_rcs

# ------------------------------
# PATH Settings
# ------------------------------
export PATH=/usr/local/bin:$PATH
# see: http://qiita.com/halo57/items/e7511f3befbcb9fedd6a
export PATH=/usr/local/opt/openssl/bin:$PATH

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

