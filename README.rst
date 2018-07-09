dotfiles
--------

All my personal dotfiles, managed with `rcm <https://github.com/thoughtbot/rcm>`_.

Installation on Ubuntu
~~~~~~~~~~~~~~~~~~~~~~

Setup rcm and the dotfiles::

    sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm
    sudo apt-get update
    sudo apt-get install rcm

    cd
    git clone https://github.com/ubmarco/dotfiles .dotfiles
    cp .dotfiles/rcrc .rcrc

    lsrc
    rcup -v

Setup ZSH::

    sudo apt install zsh fonts-powerline zsh-syntax-highlighting

    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

    # ZSH overwrote the ~/.zshrc file above, you'll have to delete the new ~/.zshrc and run again
    rcup -v

    sudo mkdir /usr/local/.zsh
    sudo mv .oh-my-zsh /usr/local/.zsh

    wget http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme
    mv bullet-train.zsh-theme /usr/local/.zsh/.oh-my-zsh/themes

Make sure your default shell is /usr/bin/zsh

You also want to create the file ~/.gitconfig_review. It's referenced in .dotfiles/gitconfig and contains the following::

    [alias]
        reviewdv = push origin HEAD:refs/for/master%r=<mail>
        reviewdw = push origin HEAD:refs/for/master%r=<mail>
        reviewall = push origin HEAD:refs/for/master%r=<mail>,r=<mail>,r=<mail>

