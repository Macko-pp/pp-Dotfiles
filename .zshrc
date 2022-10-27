# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Path to your oh-my-zsh installation.
export ZSH="/Users/maxkonietzko/.oh-my-zsh"

# Oh-my-zsh themes
# ZSH_THEME="nicoulaj"
#         "nicoulaj"
#         "random"

ZSH_THEME_RANDOM_CANDIDATES=("fino-time" "jonathan" "nicoulaj" "sorin" "nicoulaj" "robbyrussell")

# CASE_SENSITIVE="true"

# HYPHEN_INSENSITIVE="true"

# DISABLE_AUTO_UPDATE="true"

DISABLE_UPDATE_PROMPT="true"

# export UPDATE_ZSH_DAYS=13

# DISABLE_MAGIC_FUNCTIONS="true"

# DISABLE_LS_COLORS="true"

DISABLE_AUTO_TITLE="true"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

# DISABLE_UNTRACKED_FILES_DIRTY="true"

# HIST_STAMPS="mm/dd/yyyy"

# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=("git" "emacs")

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# export ARCHFLAGS="-arch x86_64"

source ~/.SystemShit/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.7.0/bin:$PATH"
# source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
export PATH="/Users/maxkonietzko/homebrew/opt/bison/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.7.0/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.6.8/bin:$PATH"
# nnn plugins
export NNN_FIFO=/tmp/nnn.fifo

# Open zellij (window manager) on start

#if read -q "choice?Do you want to launch zellij? y / n: "; then
#  sleep 2
#  /Users/maxkonietzko/.bin/zellij
#else
#  clear
#fi

# Aliases
alias lc='colorls --gs'
alias lc.='colorls --gs -a'
alias lcr='colorls --report --gs'
alias lcr.='colorls --report --gs -a'
alias lct='colorls --tree --gs'
alias lct.='colorls --tree --gs -a'
# alias run='bpython'
alias tableflip='echo "(╯°□°)╯︵ ┻━━┻"'
alias tableback="echo '┬─┬ノ(°_°ノ)'"
alias sus="echo ඞ"
alias amongus="echo ඞ"
alias amogus="echo ඞ"
alias saySus="say sus"
alias sayAmongus="say amongus"
alias sayAmogus="say amogus"
alias madness='echo "(╯°□°）╯︵ ┻━┻┬──┬ ¯"\"_(ツ) ┻━┻︵ヽ(`Д´)ﾉ︵ ┻━┻┬─┬ノ( º _ ºノ) (ノಠ益ಠ)ノ彡┻━┻"'
alias weather='curl wttr.in'
alias report="neofetch"
alias specs="neofetch"
#alias vi="vim"
alias calc="python3 /Users/maxkonietzko/Python/CalculatorCLI.py"
alias omg="echo ':o'"
alias send="python3 /Users/maxkonietzko/Python/MailFunc.py"
alias remind="python3 /Users/maxkonietzko/Python/CalendarFunc.py"
alias gh="/Users/maxkonietzko/.bin/gh"
alias spt="/Users/maxkonietzko/.bin/spt"
alias hub="/Users/maxkonietzko/.bin/hub"
alias multi="/Users/maxkonietzko/.bin/zellij"
alias console="node /Users/maxkonietzko/.bin/pretty-repl.js"
alias s="/Users/maxkonietzko/.bin/s"
alias pipes='/Users/maxkonietzko/.bin/pipes.sh'
alias sg='s -p Google'
alias sg2='s -p Github'
alias wa='node /Users/maxkonietzko/.bin/whatspup/chat.js'
alias electron="/Users/maxkonietzko/node_modules/electron/dist/Electron.app/Contents/MacOS/Electron"
alias bpy="bpython"
alias hjonk="afplay '/Applications/Desktop Goose.app/Contents/Resources/Honk1.mp3'"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias rmdir="sudo rm -d -f -r"
alias maid="bpython /Users/maxkonietzko/Maid-chan/MaidBasico.py"
alias pip="python3 -m pip"

# make vscode my default editor
export EDITOR="code"

# Customizable parameters.
PROMPT_PATH_MAX_LENGTH=30
PROMPT_DEFAULT_END=❯
PROMPT_ROOT_END=❯❯❯
PROMPT_SUCCESS_COLOR=$FG[071]
PROMPT_FAILURE_COLOR=$FG[124]
PROMPT_VCS_INFO_COLOR=$FG[242]

# Set required options.
setopt promptsubst

# Load required modules.
autoload -U add-zsh-hook
autoload -Uz vcs_info

# Add hook for calling vcs_info before each command.
add-zsh-hook precmd vcs_info

# Set vcs_info parameters.
zstyle ':vcs_info:*' enable hg bzr git
zstyle ':vcs_info:*:*' check-for-changes true # Can be slow on big repos.

zstyle ':vcs_info:*:*' unstagedstr '!'
zstyle ':vcs_info:*:*' stagedstr '+'
zstyle ':vcs_info:*:*' aheadstr '↑'
zstyle ':vcs_info:*:*' behindstr '↓'
zstyle ':vcs_info:*:*' divergedstr '↕'
zstyle ':vcs_info:*:*' cleanstr '✔'
zstyle ':vcs_info:*:*' dirtystr '✘'

zstyle ':vcs_info:*:*' actionformats "%S" "%r/%s/%b %u%c (%a%a%a)"
zstyle ':vcs_info:*:*' formats "%S" "%~, %b %u%c"
zstyle ':vcs_info:*:*' nvcsformats "%~" "%~"

#Costom prompt
PROMPT="%B%(?.%F{071}.%F{124})❯ %b%f"
RPROMPT="%{$PROMPT_VCS_INFO_COLOR%}"'$vcs_info_msg_1_'"%{$FX[reset]%}"

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    if ! IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)); then
      local ret=$?
      IFS="$si"
      return $ret
    fi
    IFS="$si"
    if type __ltrim_colon_completions &>/dev/null; then
      __ltrim_colon_completions "${words[cword]}"
    fi
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    if ! IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)); then

      local ret=$?
      IFS="$si"
      return $ret
    fi
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

export NVM_DIR="/Users/maxkonietzko/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
