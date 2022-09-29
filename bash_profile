# For info on bash_profile vs bashrc
# https://linuxize.com/post/bashrc-vs-bash-profile/

# MacOS slience bash deprecation msg
export BASH_SILENCE_DEPRECATION_WARNING=1

# bash config files
. ~/.bash_config/aliases
. ~/.bash_config/functions
. ~/.bash_config/variables
. ~/.bash_config/paths

# bash completions
# Git Completion
. ~/.git-completion.bash


# Vim mode
set -o vi


# Prompt Customization
. ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
# \W stands for the current directory
PS1='${COLOR_BLUE}\W${COLOR_GREEN}$(__git_ps1 " (%s)") ${COLOR_RESET}\n\$ '

# Enable colors (affetcts many programs like: stdout of ls)
export CLICOLOR=1

# Save path on every cd
function cd {
    builtin cd "$@"
    pwd > ~/.last_dir
}

# Restore last saved path
if [ -f ~/.last_dir ]
    then cd "`cat ~/.last_dir`"
fi
