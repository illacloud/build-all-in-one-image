#!/usr/bin/env bash
set -Eeo pipefail

# check to see if this file is being run or sourced from another script
_is_sourced() {
	# https://unix.stackexchange.com/a/215279
	[ "${#FUNCNAME[@]}" -ge 2 ] \
		&& [ "${FUNCNAME[0]}" = '_is_sourced' ] \
		&& [ "${FUNCNAME[1]}" = 'source' ]
}



_check_process() {
    ret=$(ps -aux | grep "$1" | grep -v grep)
    if [ ${#ret} -gt 0 ]; then
        echo "$ret"
    else
        echo "can not found process \"$1\"."
    fi
}
    

_main() {

    echo 
    echo 'checkout post init status.'
    echo 

    echo 'checking porcess postgres:'
    echo "$(_check_process 'postgres')"
    echo 
    
    echo 'checking porcess minio:'
    echo "$(_check_process 'minio')"
    echo 

    echo 'checking porcess envoy:'
    echo "$(_check_process 'envoy')"
    echo 

    echo 'checking porcess nginx:'
    echo "$(_check_process 'nginx')"
    echo 

    echo 'checking porcess illa-builder-backend:'
    echo "$(_check_process 'illa-builder-backend')"
    echo 

    echo 'checking porcess illa-builder-backend-ws:'
    echo "$(_check_process 'illa-builder-backend-ws')"
    echo 

    echo 'checking porcess illa-supervisor-backend:'
    echo "$(_check_process 'illa-supervisor-backend')"
    echo 

    echo 'checking porcess illa-supervisor-backend-internal:'
    echo "$(_check_process 'illa-supervisor-backend-internal')"
    echo 


    echo 
    echo 'checkout post init status done.'
    echo 

}




if ! _is_sourced; then
	_main "$@"
fi
