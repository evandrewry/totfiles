function fprompt --description 'writes out da prompt'
	printf '%s@%s%s%s%s> ' (whoami) (hostname | cut -d . -f 1) \
(set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end