#!/bin/bash
#
# (C) 2011, Igor Tsinman
#
# This script (git_ctags_cscope.sh) generates tags of the gitted 
# project. It runs ctags and cscope on all .c and .h files in 
# a project. 
#
# You can invoke it from the current dir, from a git callback, 
# from a bash alias, from a vimrc function, etc.
#
# If you're planning to use it as a git hook, example post-merge,
# post-commit or post-checkout callback, you should make this 
# script executable and then link to it in the repository you 
# would like to use it in:
#
# $ cd to-project-dir
# $ ln -sf /path-to/git_ctags_cscope.sh .git/hooks/post-merge
# $ ln -sf /path-to/git_ctags_cscope.sh .git/hooks/post-commit
# $ ln -sf /path-to/git_ctags_cscope.sh .git/hooks/post-checkout
#
# Here is an example run on the project contains ~19K SLOC:
#
# Language  Files       Code    Comment  Comment %      Blank      Total
# --------- -----  ---------  ---------  ---------  ---------  ---------
# c            29      18461       1881       9.2%       2418      22760
#
# $ time git_ctags_cscope.sh 
#
# real  0m1.687s
# user  0m1.600s
# sys   0m0.136s

# Resources:
# -> http://cscope.sourceforge.net/cscope_vim_tutorial.html
# -> http://cscope.sourceforge.net/large_projects.html
# -> http://vimdoc.sourceforge.net/htmldoc/if_cscop.html
#
# TODO: install option

cscope_db=${PWD}/cscope.out

function tags_generate () {
    local cscope_files='cscope.files'
    local cscope_out='cscope.out'

    # clean old files
    rm -f ${cscope_out} tags

    # prepare list of source files
    git ls-files|grep "\.[ch]$" >> ${cscope_files}

    # genarate both ctags and cscope
    cscope -b -q
    ctags -R --c-kinds=+p --fields=+S -L ${cscope_files}

    # export CSCOPE_DB (better way use it in vimrc)
    CSCOPE_DB=${cscope_db}
    export CSCOPE_DB
}

# HERE

if [[ -d .git ]]; then
    tags_generate
else
    echo "STOP: Is this .git project?"
fi

