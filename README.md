QCVim
===

Introduction
---
vim highlighters for quantum chemistry packages.

Usage
----
For *nix users, copy the corresponding file to $HOME/.vim/ftplugins and $HOME/.vim/syntax, and and it should work. If you are using Vundle, then add this line to your .vimrc:

    Plugin 'xis19/qcvim'

and it should work. If it does not work, confirm

    filetype indent plugin on
    syntax on                              " enable file syntax

stays after

    call vundle#end()
