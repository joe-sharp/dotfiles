##### Aliases #####
alias dog='less -FX'
alias lll='exa -lhgH'
alias w3m='w3m -sixel'
alias www='w3m'
alias arst='asdf'
function colordiff () { diff -u $@ | diff-so-fancy }
function httpcat() { INPUT=$@ && curl https://http.cat/$INPUT.jpg | imgcat }
function rubo() { if [ -f Gemfile ]; then bundle exec rubocop $@; else rubocop $@; fi }
function b() { if [ -f Gemfile ]; then bundle exec $@; else $@; fi }
                # avoid loop          # force columns      # preserve color hack          # truncate output
function cd() { builtin cd -P "$@" && COLUMNS=$(tput cols) script -q /dev/null ls -GaFC | head -n $(tput lines) }
function mla()
{
  if [[ "$PWD" == *linter-configs ]]
  then mega-linter-runner
  else mega-linter-runner -e 'MEGALINTER_CONFIG=https://raw.githubusercontent.com/joe-sharp/linter-configs/main/.mega-linter.yml'
  fi
}

### git and github ###
alias gdst='git diff stash@{0}^ stash@{0}'
alias gai='git add -p'
alias gbc='git branch-cleanup'
alias gpim='git pull && git pull --no-rebase origin master'
alias gurd='git update-ref -d'
alias gpn='git push --no-verify'
alias gcob='git checkout -b'
alias gs='git status'
alias gsc="$HOME/bin/gsc"
alias gh='GITHUB_TOKEN=$(/usr/bin/sudo cat ~/.secrets/gh) gh'
alias ghv='gh pr view'
alias ghw='gh pr view --web'
alias ghl='gh pr list -l core-frameworks'
alias ghc='gh pr checks'
alias ghd='gh pr diff'
alias ghm='gh pr merge && gl'
alias ghs='gh pr status'
function gppr() { if [ -f bin/gppr ]; then bin/gppr; else gh pr create -a joe-sharp; fi }

### Docker ###
alias drm='docker rm'
alias drma="docker rm $(docker ps -q -f status=exited)"

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
ANTIGEN_CACHE=$HOME/.antigen/init-0${TERM_PROGRAM}.zsh
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
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zdharma/zsh-diff-so-fancy
if (( ${+TERM_PROGRAM} ));
then
  antigen theme https://gist.github.com/5b0c67179aa076ff53e7c03c4191eec3 joe-style
  export omg_ungit_prompt="%B%F{6}%~%f%b 🔮%B%F{233}❯%F{55}❯%F{27}❯%f%b "
else
  antigen theme https://gist.github.com/5b0c67179aa076ff53e7c03c4191eec3 remote-style
  export omg_ungit_prompt="%B%F{6}%~%f%b 🔮%B%F{cyan}❯%F{55}❯%F{27}❯%f%b "
fi
antigen apply

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
alias gcm='git checkout main || (print $fg_bold[red]This repository is still not using \"main\"!$reset_color && git checkout master)'

##### MOTD #####
if [ "$(w -h | grep "^$(whoami) *s[^ ]* *-"|wc -l)" -eq "1" ]; then /usr/local/bin/neofetch; fi
