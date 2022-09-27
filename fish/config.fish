# set fish_function_path $fish_function_path "/usr/share/powerline/bindings/fish"
# source /usr/share/powerline/bindings/fish/powerline-setup.fish
# powerline-setup

# Trying starhip instead
starship init fish | source

# vi mode
fish_vi_key_bindings

# and now restore ctrl+f for autocomplete
# https://github.com/fish-shell/fish-shell/issues/3541
function fish_user_key_bindings
	for mode in insert default visual
		bind -M $mode \cf forward-char
	end
end

# aliases taken from bashrc
alias python='python3'
alias ls='ls --color=auto'
alias lg='lazygit'
alias ll='ls --color=auto -alFh'
alias fchroni='ssh -i ~/.ssh/id_rsa matze@chronicler.de'
alias svenv='source ~/workspace/python/venvs/wvenv3.10/bin/activate.fish'
# change the eps1 to not modify prompt
alias nv='nvim'
alias tm='tmux'

# super nice: Spawns a new terminal a the same pwd!
alias s="trap '' 0 && st >/dev/null 2>&1& disown"

# addid papers to the lib
alias pap='~/.local/bin/add_and_sync_pdf.sh'

# more native xclip usage for piping straight to xclip: e.g. ls * | xclipc
alias xclipc='xclip -selection c'

# Disable propt change for venvs -> do this via powerline anyways
set VIRTUAL_ENV_DISABLE_PROMPT 1        # for python
set NODE_VIRTUAL_ENV_DISABLE_PROMPT 1   # for node 

# some eye candy -> for the vim mode
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

# Paths
fish_add_path /opt/homebrew/bin


# Remove the greeting, on mac this probably needs to be done here, arch was globally
set fish_greeting ""

