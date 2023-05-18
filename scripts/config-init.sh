#!/usr/bin/env bash
set -Eeo pipefail

# check to see if this file is being run or sourced from another script
_is_sourced() {
	# https://unix.stackexchange.com/a/215279
	[ "${#FUNCNAME[@]}" -ge 2 ] \
		&& [ "${FUNCNAME[0]}" = '_is_sourced' ] \
		&& [ "${FUNCNAME[1]}" = 'source' ]
}



_is_user_exists() {
    if id "$1" &>/dev/null; then
        echo \"$1\"' found'
    else
        echo \"$1\"' NOT found'
    fi
}

_checkout_now_user() {
    idinfo=`id`
    echo \"$idinfo\"
}


_grant_permission_to_now_user() {
    local current_user; current_user="$(id -u)"
    local current_user_name; current_user_name="$(id -un)"
    local current_group; current_group="$(id -g)"

    
}
    

_main() {

    echo 
    echo 'checkout runtime environment.'
    echo 

    # check kernel and lib version
    I_UNAME_INFO=`uname -a`
    I_GLIBC_VERSION=`ldd --version| grep 'ldd'`

    


    # output
    echo 'kernel version: '${I_UNAME_INFO}
    echo 'glibc version: '${I_GLIBC_VERSION}

    # check user id
    echo "detect user:" $(_is_user_exists 'root')
    echo "detect user:" $(_is_user_exists 'postgres') 
    echo "current user is:" $(_checkout_now_user) 


    # grant permission
    _grant_permission_to_now_user

    echo 
    echo 'checkout runtime environment done.'
    echo 

}






if ! _is_sourced; then
	_main "$@"
fi
