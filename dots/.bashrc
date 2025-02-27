# FZF Utils
alias fzf='fzf --preview="bat --color=always {}"'
alias ff='cd $(find * -type d | fzf)'
alias vzf='vi $(fzf)'

# Other
alias la='ls -a'
alias nixos-rebuild-switch='sudo nixos-rebuild switch --flake /etc/nixos/#nixos'
