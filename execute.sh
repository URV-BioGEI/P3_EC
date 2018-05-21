#!/bin/bash

parameters=(
	"-cache:dl1 dl1:64:32:4:l -cache:il1 il1:64:32:4:l -cache:dl2 ul2:64:32:4:l"
)

mkdir Results 2> /dev/nul
mkdir Out 2> /dev/nul
echo "" > _Resultats
j=0
for i in ${parameters[@]}; do

	simplesim-3.0_acx/sim-outorder -fastfwd 50000000 -max:inst 10000000 ${parameters[$j]} -redir:sim Results/applu.txt Benchmarks/applu/exe/applu.exe < Benchmarks/applu/data/ref/applu.in >> Out/applu.out 2>> Out/applu.err 

	simplesim-3.0_acx/sim-outorder -fastfwd 50000000 -max:inst 10000000 ${parameters[$j]} -redir:sim Results/crafty.txt Benchmarks/crafty/exe/crafty.exe < Benchmarks/crafty/data/ref/crafty.in >> Out/crafty.out 2>> Out/crafty.err

	simplesim-3.0_acx/sim-outorder -fastfwd 50000000 -max:inst 10000000 ${parameters[$j]} -redir:sim Results/twolf.txt Benchmarks/twolf/exe/twolf.exe Benchmarks/twolf/data/ref/ref >> Out/twolf.out 2>> Out/twolf.err

	#simplesim-3.0_acx/sim-outorder -fastfwd 50000000 -max:inst 10000000 ${parameters[$j]} -redir:sim Results/vortex.txt Benchmarks/vortex/exe/vortex.exe lendian1.raw >> Out/vortex.out 2>> Out/vortex.err  

	cd Benchmarks/vortex/data/ref/
	../../../../simplesim-3.0_acx/sim-outorder -fastfwd 50000000 -max:inst 10000000 ${parameters[$j]} -redir:sim ../../../../Results/vortex.txt ../../exe/vortex.exe lendian1.raw >> vortex.out 2>> vortex.err  
	cd ../../../../

	simplesim-3.0_acx/sim-outorder -fastfwd 50000000 -max:inst 10000000 ${parameters[$j]} -redir:sim Results/gzip.txt Benchmarks/gzip/gzip/exe/gzip.exe < Benchmarks/gzip/gzip/data/ref/input.source >> Out/gzip.out 2>> Out/gzip.err 

	# simplesim-3.0_acx/sim-outorder -fastfwd 50000000 -max:inst 10000000 ${parameters[$j]} -redir:sim Results/vpr.txt Benchmarks/vpr/exe/vpr.exe Benchmarks/vpr/data/ref/net.in Benchmarks/vpr/data/ref/arch.in Benchmarks/vpr/data/ref/route.out -nodisp -route_only -route_chan_width 15 -pres_fac_mult 2 -acc_fac 1 -first_iter_pres_fac 4 -initial_pres_fac 8 >> Out/vpr.out 2>> Out/vpr.err


	echo ${parameters[$j]}
	echo \n\n >> _Resultats
	echo ${parameters[$j]} >> _Resultats
	echo \n\n >> _Resultats

	more Results/* | grep -E miss_rate >> _Resultats
	let j=j+1
	if [ $j == 24 ]; then 
		break 
	fi
done
echo "Final de fase 1"
rm -f costs.out
rm -f game.001
rm -f nul
exit 0
