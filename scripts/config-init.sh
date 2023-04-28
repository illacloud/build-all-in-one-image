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
    echo "detect user:" $(_is_user_exists 'redis') 
    echo "detect user:" $(_is_user_exists 'minio') 
    echo "detect user:" $(_is_user_exists 'envoy') 
    echo "detect user:" $(_is_user_exists 'illa') 




    echo 
    echo 'checkout runtime environment done.'
    echo 

}






if ! _is_sourced; then
	_main "$@"
fi
