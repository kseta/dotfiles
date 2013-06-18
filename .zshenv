# ------------------------------
# Boxen Settings
# ------------------------------
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
[ -f /opt/boxen/nvm/nvm.sh ] && source /opt/boxen/nvm/nvm.sh

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
