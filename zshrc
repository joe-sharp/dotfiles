##### Aliases #####
alias dog='less -FX'
alias lll='exa -lhgH'
alias w3m='w3m -sixel'
alias www='w3m'
alias arst='asdf'
alias v='vim'
function colordiff () { diff -u $@ | diff-so-fancy }
function httpcat() { RESPONSE=$@ && curl https://http.cat/$RESPONSE.jpg | imgcat }
function rubo() { if [ -f Gemfile ]; then bundle exec rubocop $@; else rubocop $@; fi }
function b() { if [ -f Gemfile ]; then bundle exec $@; else $@; fi }
function super-lint() { FILE=$@ && docker run -e RUN_LOCAL=true -v $FILE:/tmp/lint/file github/super-linter }
function super-lint-all() { DIR=$@ && docker run -e RUN_LOCAL=true -v $DIR:/tmp/lint github/super-linter }
                # avoid loop          # force columns      # preserve color hack          # truncate output
function cd() { builtin cd -P "$@" && COLUMNS=$(tput cols) script -q /dev/null ls -GaFC | head -n $(tput lines) }
function mla()
{
  if [[ "$PWD" == *linter-configs ]]
  then mega-linter-runner -e 'SHOW_ELAPSED_TIME=true'
  else mega-linter-runner -e 'SHOW_ELAPSED_TIME=true' -e 'LINTER_RULES_PATH=https://raw.githubusercontent.com/joe-sharp/linter-configs/main'
  fi
}

### git and github ###
alias gdst='git diff stash@{0}^ stash@{0}'
alias gai='git add -p'
alias gbc='git branch-cleanup'
alias gpim='git pull && git pull origin master'
alias gurd='git update-ref -d'
alias gpn='git push --no-verify'
alias gcob='git checkout -b'
alias gh='GITHUB_TOKEN=$(/usr/bin/sudo cat ~/.secrets/gh) gh'
alias ghv='gh pr view'
alias ghw='gh pr view --web'
alias ghl='gh pr list -l core-frameworks'
alias ghc='gh pr checks'
alias ghd='gh pr diff'
alias ghm='gh pr merge && gl'
alias ghs='gh pr status'
function gppr() { if [ -f bin/gppr ]; then bin/gppr; else gh pr create -a joe-sharp; fi }

##### Applications #####
### RBENV ###
eval "$(rbenv init -)"

### The Fuck?! ###
eval $(thefuck --alias)
eval $(thefuck --alias FUCK)
eval $(thefuck --alias oops)

### NVM ###
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

### antigen (ZSH Plugin Manager) ###
source "/usr/local/bin/antigen.zsh"
antigen use oh-my-zsh
antigen bundle arialdomartini/oh-my-git
antigen bundle git
antigen bundle ruby
antigen bundle thefuck
antigen bundle colored-man-pages
antigen bundle command-not-found
antigen bundle man
antigen bundle MichaelAquilina/zsh-you-should-use
antigen bundle $HOME/.antigen/bundles/custom/joesharp
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zdharma/zsh-diff-so-fancy
antigen theme custom/joesharp joe-style
antigen apply
export omg_ungit_prompt="%B%F{6}%~%f%b 🔮%B%F{8}❯%F{55}❯%F{6}❯%f%b "

### iTerm2 Shell Integrations ###
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

### ASDF ###
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

### FZF ###
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export RIPGREP_CONFIG_PATH=$HOME/.config/rg/config
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

### broot ###
[ -f ~/.config/broot/launcher/bash/br ] && source ~/.config/broot/launcher/bash/br

### work ###
[ -f ~/.config/workrc ] && source ~/.config/workrc

##### Override Antigen Plugin Aliases #####
### git ###
alias gba="$HOME/bin/gba"
alias gstd="$HOME/bin/gstd"
alias gp="git push -u origin HEAD"
alias gcm='git checkout main || (echo This repository is still not using \"main\"! && git checkout master)'

##### MOTD #####
if [ "$(w -h | grep "^$(whoami) *s[^ ]* *-"|wc -l)" -eq "1" ]; then /usr/local/bin/neofetch; fi
