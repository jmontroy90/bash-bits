#!/usr/bin/env bash

print_usage() {
cat <<EOF
Generic template and functions for a bunch of different bash CLI use cases
Author: John Montroy <john.montroy@jet.com>

Usage: $0 [options]
        -d, --debug              run in debug mode (no eval, just echo commands)
        -h, --help               print this usage
EOF
}

eval_errorandlog() {
        printf -- '\n----- BEGIN: %s -----\n' "$2"
        eval $1
        printf -- '\n----- END: %s -----\n' "$2"
}

(( "$#" == 0)) && print_usage

## directory work
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TOPDIR=$(basename "$DIR")

while :; do
        case $1 in
                -d|--debug)
                        DEBUG=$1
                        shift
                        ;;
                -h|--help)
                        print_usage
                        exit 0
                        ;;
                -?*)
                        printf 'WARN: Unknown option (ignored): %s\n' "$1" >&2
                        ;;
                --)
                        shift
                        break
                        ;;
                *)
                        break
        esac
        shift
done
