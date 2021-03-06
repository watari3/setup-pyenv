#!/bin/bash

function puts_required_apt {
    echo "Install the following packages"
    echo "sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils"

}
function puts_required_yum {
    echo "Install the following packages"
    echo "sudo yum install -y make gcc openssl-devel bzip2-devel readline-devel autoconf zlib-devel sqlite-devel"
}


export PYENV_HOME=${HOME}/.pyenv
DIST=`lsb_release -i | awk '{print $3}'`

if [ ${DIST} = "Debian" ]; then
    puts_required_apt
fi
if [ ${DIST} = "Ubuntu" ]; then
    puts_required_apt
fi
if [ ${DIST} = "CentOS" ]; then
    puts_required_yum
fi

if [ -e $PYENV_HOME ]; then
    echo "Exist $PYENV_HOME"
else
 git clone https://github.com/pyenv/pyenv.git $PYENV_HOME
    echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> $HOME/.bashrc
    echo 'eval "$(pyenv init -)"' >> $HOME/.bashrc
fi

if [ -e $PYENV_HOME/plugins ]; then
    echo "Exist $PYENV_HOME/plugins"
else
    mkdir -p $PYENV_HOME/plugins
fi
    
if [ -e $PYENV_HOME/plubins/pyenv-update ]; then
    echo "Exist $PYENV_HOME/pyenv-update"
else
    git clone https://github.com/pyenv/pyenv-update.git $PYENV_HOME/plugins/pyenv-update
fi
