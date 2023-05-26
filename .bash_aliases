alias cp='cp -i' # Prompts before overwriting files
alias ls='ls --color=auto -alF' # List all files, including hidden files, with a nice format
alias mv='mv -i' # Prompts before overwriting files
alias mkdir='mkdir -p' # Create directories, including parent directories if necessary
alias wget='wget -c' # Continue downloading interrupted downloads
alias cd='cd -P' # Change directories, following symbolic links only once
alias clr='clear && printf "\033[3J\033[H"' # Clear the screen and move the cursor to the top
alias hist='history -w' # Write the history to a file
alias tree='tree -C' # Show the directory tree with colors

alias ..='cd ..' # Change to parent directory
alias ...='cd ../..' # Change to grandparent directory
alias ....='cd ../../..' # Change to great-grandparent directory
 
alias pym='python3 manage.py'
alias mkvenv='python3 -m venv venv'
alias startvenv='source venv/bin/activate && which python3'
alias stopvenv='deactivate venv'

alias ros='singularity run --nv ros-container.sif'
alias rosexam='singularity run --nv ros-container_1.sif'