#!/bin/bash
proxy=$1
target=$2
processNumber=$3

echo "Trying: httping -x $proxy -g $target -c 1"
res="`httping -x $proxy -g $target -c 1`"
if [[ "$res" == *" 0.00% failed"* ]]
then
	echo "Good: $proxy"
	echo "$proxy" > out$processNumber
else
	echo "Bad: $proxy"
fi
#echo "Actual Info: $res"
