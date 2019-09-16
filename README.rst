dotfiles
--------

All my personal dotfiles, managed with `rcm <https://github.com/thoughtbot/rcm>`_.

Usage
~~~~~

Install rcm following installation description in above repo for your distribution.

Clone the repo and link the .rcrc file (it's handled by rcm afterwards)::

    cd ~
    git clone https://github.com/ubmarco/dotfiles .dotfiles
    ln -s .dotfiles/rcrc .rcrc

Look at the target layout (does not modify anything yet)::

    lsrc

There are 2 tags available, home and work. Look at what they will do::

    lsrc -t home
    lsrc -t work

Install non-tagged file/folder structures::

    rcup

Install for tag home::

    rcup -t home

Install for tag work::

    rcup -t work
