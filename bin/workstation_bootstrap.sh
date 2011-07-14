#!/bin/bash

# When this scipt configures my USER environment, it
## checks a new version on github (optinaly)
## checks and/or removes old links and files
## installs a new links

# installed dirs and files
## == bash
## == bin
## == doc
## == git
## == rss (newsbeuter)
## == vim
## == README

function help () {
    echo help
}

# first install on the fresh machine *_check-move functions 

function bash_check-move () {
    local dot=(.bashrc .bash_login .bash_logout .profile)
    for i in ${dot[@]}; do  
        [[ -f "${HOME}/${i}" && ! -L "${HOME}/${i}" ]] && {
            mv ${verbose} "$HOME/${i}" "$HOME/${i}.`date '+%Y-%m-%d'`"
        }
    done
}

function git_check-move () {
    [[ -f "${HOME}/.gitconfig" && ! -L "${HOME}/.gitconfig" ]] && {
        mv ${verbose} "${HOME}/.gitconfig" \
            "${HOME}/.gitconfig.`date '+%Y-%m-%d'`"
    }
    [[ -f "${HOME}/.gitignore" && ! -L "${HOME}/.gitignore" ]] && {
        mv ${verbose} "${HOME}/.gitignore" \
            "${HOME}/.gitignore.`date '+%Y-%m-%d'`"
    }
}

function rss_check-move () {
    [[ -f "${HOME}/.newsbeuter/config" && \
        ! -L "${HOME}/.newsbeuter/config" ]] && {
        mv ${verbose} "${HOME}/.newsbeuter/config" \
            "${HOME}/.newsbeuter/config.`date '+%Y-%m-%d'`"
    }
}

function vim_check-move () {
    [[ -d "${HOME}/.vim" && ! -L "${HOME}/.vim" ]] && {
        mv ${verbose} "${HOME}/.vim" "${HOME}/.vim.`date '+%Y-%m-%d'`"
    }
    [[ -f "${HOME}/.vimrc" && ! -L "${HOME}/.vimrc" ]] && {
        mv ${verbose} "${HOME}/.vimrc" "${HOME}/.vimrc.`date '+%Y-%m-%d'`"
    }
}

function bash_install () {
    local dot=(bashrc bash_login bash_logout profile bash_aliases \
               bash_colors bash_functions bash_rugged)
    for i in ${dot[@]}; do  
        [[ -L "${HOME}/.${i}" ]] && { rm -f ${verbose} "${HOME}/.${i}"; }
        ln -s ${verbose} ${PWD}/bash/${i} ${HOME}/.${i} 
    done
}

function git_install () {
    local dot=(gitconfig gitignore)
    for i in ${dot[@]}; do  
        [[ -L "${HOME}/.${i}" ]] && { rm -f ${verbose} "${HOME}/.${i}"; }
        ln -s ${verbose} ${PWD}/git/${i} ${HOME}/.${i} 
    done
}

function rss_install () {
    [[ -L "${HOME}/.newsbeuter/config" ]] && { 
        rm -f ${verbose} "${HOME}/.newsbeuter/config"; }
    ln -s ${verbose} ${PWD}/rss/config ${HOME}/.newsbeuter/config
}

function vim_install () {
    [[ -L "${HOME}/.vim" ]] && { rm -fr ${verbose} "${HOME}/.vim"; }
    ln -s ${verbose} ${PWD}/vim/vim ${HOME}/.vim 
    [[ -L "${HOME}/.vimrc" ]] && { rm -f ${verbose} "${HOME}/.vimrc"; }
    ln -s ${verbose} ${PWD}/vim/vimrc ${HOME}/.vimrc 
}

function bin_install () {
    [[ -L "${HOME}/.bin" ]] && { rm -fr ${verbose} "${HOME}/.bin"; }
    ln -s ${verbose} ${PWD}/bin ${HOME}/.bin 
}

function doc_install () {
    [[ -L "${HOME}/.doc" ]] && { rm -fr ${verbose} "${HOME}/.doc"; }
    ln -s ${verbose} ${PWD}/doc ${HOME}/.doc
}

function main () {
    bash_check-move
    bash_install

    git_check-move
    git_install

    rss_check-move
    rss_install

    vim_check-move
    vim_install

    bin_install
    doc_install
}

# = HERE =
if [[ $# -eq 0 ]]; then
    main > /dev/null 2>&1
elif [[ $1 = "--verbose" || $1 = "-v" ]]; then
    verbose="-v"
    main
elif [[ $1 = "--help" || $1 = "-h" ]]; then
    help
    exit 1
else
    help
    exit 1
fi

source ${HOME}/.bashrc
