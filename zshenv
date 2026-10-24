##### PATH, additions at bottom #####
            # Bundler Binstubs  # ~/bin   # MacPorts     # MacPorts      # Postgres                        # Cargo (Rust)    #####
export PATH=.git/safe/../../bin:$HOME/bin:/opt/local/bin:/opt/local/sbin:/usr/local/opt/postgresql@9.6/bin/:$HOME/.cargo/bin:$PATH

##### ENV #####
if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  export EDITOR="cursor --wait"
  export VISUAL="cursor --wait"
  alias open='cursor'
  alias code='cursor'
else
  export EDITOR=/usr/bin/vim
  export VISUAL=/usr/bin/vim
fi

export PAGER='/usr/bin/less -FX'
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"

export RUBY_DEBUG_IRB_CONSOLE=true

##### ASDF #####
export ASDF_DATA_DIR='/Users/joesharp/.asdf'
