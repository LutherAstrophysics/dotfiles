alias ls="ls --color" 
source $HOME/.bash_profile

# Path
PATH=$PATH:~/Softwares

function update-m23-db {
    cd /home/m23/Desktop/light-curves/backend/scripts
    a
    python3 update-m23-db.py
    cd -
}

function restart-frontend {
    kill -9 `ss -tlpn | grep 2300 | sed -E 's/^.*pid=//' | sed -E 's/,.*//'` || true
    cd ~/Desktop/light-curves/client/
    yarn build
    yarn start
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
