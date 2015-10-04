#!/bin/bash

function rev() {
    local -i len=${#1};
    local -i ii;
    rw="";
    for (( ii=len; ii; ii--)); do
        rw+=${1:ii-1:1};
    done;
};

typeset -iA m;
typeset -a w z;
typeset -i n wn v i j k u;
typeset x c s y;
mapfile -t z;

n=${z[0]};
c="";
s="";

for (( i=n; i; i--)); do {
    x=${z[i]};
    rev $x;
    if [[ $x < $rw ]]; then
        y=$x;
    else
        y=$rw;
    fi;
    m[$y]+=1;
}; done;

wn=0;
for x in ${!m[*]}; do { 
    v=${m[$x]};
    if [[ v -gt 1 ]]; then { 
        w[$wn]=$x;
        wn+=1;
    }; fi;
    u=$((v & 1));
    if [[ u -eq 1 ]]; then { 
        rev $x;
        if [[ $x == $rw ]]; then
            if [[ $c == "" || $c > $x ]]; then
                c=$x;
            fi;
        fi;
    }; fi;
}; done;

for (( i=wn; i; i--)); do { 
    k=$i;
    for (( j=i-1; j; j--)); do {
        if [[ ${w[j-1]} < ${w[k-1]} ]]; then
            k=$j;
        fi;
    }; done;
    x=${w[i-1]};
    w[i-1]=${w[k-1]};
    w[k-1]=$x;
}; done;

for (( i=wn; i; i--)); do {
    x=${w[i-1]};
    v=$((${m[$x]} >> 1));
    for (( j=v; j; j--)); do {
        s+=$x;
    }; done;
}; done;

rev $s;

echo -n $s;
echo -n $c;
echo $rw;
