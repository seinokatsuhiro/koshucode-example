#!/bin/sh
#
#  DESCRIPTION
#    Generate CALC.k
#
#  USAGE
#    ./GEN-CALC.sh > CALC.k
#    ./GEN-CALC.sh -u
#

comment () {
    cat <<EOF
** -*- koshu -*-
**
**  DESCRIPTION
**    Calculation list of dictionary examples.
**
**  USAGE
**    koshu --calc CALC.k
**

EOF
}

koshu_calc () {
    printf "|-- KOSHU-CALC  /input %-35s /output %s\n" "$1" "$2"
}

koshu_calc_list () {
    for k in [a-z]*.k; do
        koshu_calc "[ 'DATA.k : '$k ]" "'OUTPUT/$k"
    done
    echo
}

calc_list () {
    comment
    koshu_calc_list
}

if [ "$1" = "-u" ]; then
    echo "output to CALC.k"
    calc_list > CALC.k
else
    calc_list
fi

