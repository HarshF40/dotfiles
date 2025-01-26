if status is-interactive
	set -g fish_greeting ""
	set -Ux COLORTERM truecolor
	set -Ux TERM alacritty
	alias ls='exa --icons'
    # Commands to run in interactive sessions can go here
end
