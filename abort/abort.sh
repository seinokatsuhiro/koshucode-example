#!/bin/sh
#
#  Examples of aborting calculations
#

abort_usage () {
    echo "DESCRIPTION"
    echo "  Examples of aborting calculations"
    echo
    echo "USAGE"
    echo "  $0 [OPTION] FILE"
    echo "  $0 [OPTION] < FILE"
    echo
    echo "OPTIONS"
    echo "  -i    Input filter"
    echo "  -o    Output filter"
}

abort_process () {
    if [ -z "$abort_output" ]; then
        abort_koshu "$@"
    else
        abort_koshu "$@" | grep -i "$abort_output"
    fi
}

abort_koshu () {
    abort_input "$@" | xargs -I {} sh -c '
      line="{}"
      name=`echo "$line" | cut -d " " -f 1`
      echo "** **********************  $name"
      echo "$line" | cut -d " " -f 2- | koshu --stdin
      echo
      '
}

abort_input () {
    if [ -z "$abort_input" ]; then
        abort_input2 "$@"
    else
        abort_input2 "$@" | grep -i "$abort_input"
    fi
}

abort_input2 () {
    cat "$@" | grep ^Abort
}

# ----------------------

while getopts hi:o: name; do
    case "$name" in
        i)  abort_input="$OPTARG" ;;
        o)  abort_output="$OPTARG" ;;
        ?)  abort_usage
            exit ;;
    esac
done

shift $((OPTIND - 1))
abort_process "$@"

