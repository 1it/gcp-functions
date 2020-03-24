#!/usr/bin/env bash

# Error Handling
function on_error() {
    echo "error: [ ${BASH_SOURCE[1]} at line ${BASH_LINENO[0]} ]";
    exit 1;
}

function on_exit() {
    if [ "$?" -ne 0 ]; then echo "command failed"; exit 1; fi
    exit $?;
}

set -o errtrace
trap on_error ERR
trap on_exit EXIT
