if [ -f $HOME/.bashrc ]; then
    source $HOME/.bashrc
fi
source /etc/bash_completion.d/azds
export PATH="/usr/local/opt/curl/bin:$PATH"
export UNDERWAY_HOME=/Users/mattraibert/src/underway-dev/