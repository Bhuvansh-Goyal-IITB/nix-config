# For limiting battery to 60%
echo 60 | sudo tee /sys/class/power_supply/BAT1/charge_control_end_threshold > /dev/null

# Env Vars
export ZDOTDIR="$HOME"
export EDITOR="hx"

# Alias
alias ls="eza --icons=auto"
alias rz='source $ZDOTDIR/.zshrc'
alias ez='$EDITOR $ZDOTDIR/.zshrc'

# Packages setup
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)" 
eval "$(direnv hook zsh)"

# Zsh setup
source "$HOME/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.nix-profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
autoload -U compinit; compinit
source "$HOME/.nix-profile/share/fzf-tab/fzf-tab.plugin.zsh"

# Zellij starter script
ZJ_SESSIONS=$(zellij ls -n -s)
NUM_SESSIONS=$(zellij ls | wc -l)

if [[ -z "$ZELLIJ" ]]; then
  if (( NUM_SESSIONS >= 2 )); then
    zellij attach "$(echo "$ZJ_SESSIONS" | fzf)"
  else 
    zellij a -c
  fi
fi
