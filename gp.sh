#!/bin/bash
wget "https://www.proxynova.com/proxy-server-list/country-bd/" -O proxyNova
echo "Extracting Ip:Port..."
./extractIpPort proxyNova
echo "removing: proxyNova"
rm proxyNova
if [[ -f "out" ]]
then
	echo "removing: out"
	rm out
fi
i=0
while read -r line
do
	./PING.sh $line 10.16.100.244 $i&
    i=$((i+1))
done < "iplist"
wait
while [[ "$i" != "0" ]]
do
	i=$((i-1))
	if [[ -f "out$i" ]]
	then
        cat out$i >> out
        rm out$i
    fi
done
cat out
