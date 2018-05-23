#!/bin/bash

if [ "$2" == "0" ]; then
	dl="64:32:4:l"
else
	dl=$2
fi

if [ "$3" == "0" ]; then
	il="1024:16:1:l"
else
	il=$3	
fi

if [ "$4" == "0" ]; then
	ul="256:64:4:l"
else
	ul=$4
fi

sos=$1"_sim_app"

./sim-outorder -max:inst 10000000 -fastfwd 50000000 -redir:sim $sos -cache:dl1 dl1:$dl -cache:il1 il1:$il -cache:dl2 ul2:$ul applu/exe/applu.exe < applu/data/ref/applu.in 

sos=$1"_sim_cra"

./sim-outorder -max:inst 10000000 -fastfwd 50000000 -redir:sim $sos -cache:dl1 dl1:$dl -cache:il1 il1:$il -cache:dl2 ul2:$ul crafty/exe/crafty.exe < crafty/data/ref/crafty.in 

sos=$1"_sim_two"

./sim-outorder -max:inst 10000000 -fastfwd 50000000 -redir:sim $sos  -cache:dl1 dl1:$dl -cache:il1 il1:$il -cache:dl2 ul2:$ul twolf/exe/twolf.exe twolf/data/ref/ref

sos=$1"_sim_vor.in"

cp vortex/data/ref/* . 
./sim-outorder -max:inst 10000000 -fastfwd 50000000 -redir:sim $sos -cache:dl1 dl1:$dl -cache:il1 il1:$il -cache:dl2 ul2:$ul vortex/exe/vortex.exe lendian1.raw

sos=$1"_sim_zip.in"

cp gzip/data/ref/* . 
./sim-outorder -max:inst 10000000 -fastfwd 50000000 -redir:sim $sos -cache:dl1 dl1:$dl -cache:il1 il1:$il -cache:dl2 ul2:$ul gzip/exe/gzip.exe input.source 60


