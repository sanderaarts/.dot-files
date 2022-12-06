# Case-insensitive 'globbing' (expanding wild-card characters)
setopt NO_CASE_GLOB

# Save command history
HISTSIZE=2000
SAVEHIST=5000
# Share history across multiple zsh sessions
setopt SHARE_HISTORY
# Append to history
setopt APPEND_HISTORY
# Do not store duplications
setopt HIST_IGNORE_DUPS
# Removes blank lines from history
setopt HIST_REDUCE_BLANKS
# Confirm history substitution
setopt HIST_VERIFY

# Use intelligent history search, using on what's already been typed as prefix
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# Prompt for corrections
setopt CORRECT
setopt CORRECT_ALL

# Some global* ls aliases (* works also when not the first command)
#alias -g ll='ls -l'
alias -g ll='ls -alFH'
#alias -g la='ls -A'
#alias -g l='ls -CF'

# Suffix aliases respond to the last part of path (often the extention)
alias -s txt='open -t'

### Prompt #####
# Load version control information
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt PROMPT_SUBST
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' %F{21}(%b)%f'
zstyle ':vcs_info:*' enable git
# Set prompt
PROMPT='%F{yellow}%n@%m%f:%F{white}%~%f${vcs_info_msg_0_} %(?.%F{green}√.%F{red}?%?)%f %# '

# Default editor
export EDITOR=pico

# File permissions
# dirs: 755 / files: 644
umask 0002

# NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# NPM
NPM_PACKAGES="${HOME}/.npm"
path=("$NPM_PACKAGES/bin" $path)
export PATH

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
manpath=("$NPM_PACKAGES/share/man" $manpath)
export MANPATH
