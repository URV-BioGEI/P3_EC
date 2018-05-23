#!/bin/bash

# nombre:numerodeconjuntos:tamañodelinea:asociatividad
# (tamañototal (KB) * 1024 B/KB) / (Tamaño de bloque) = Entradascache(bloques)
# entradascache / asociatividad = sets(conjuntos)
# 7+7+7+8+5+5+4 = 43
parameters=(
	#fase 1
	#tasca 1 (valores por defecto)
	"-cache:dl1 dl1:64:32:4:l -cache:il1 il1:1024:16:1:l -cache:dl2 ul2:256:64:4:l"
	#tasca2 modificar mida dl1
	"-cache:dl1 dl1:32:32:1:l -cache:il1 il1:1024:16:1:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:64:32:1:l -cache:il1 il1:1024:16:1:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:128:32:1:l -cache:il1 il1:1024:16:1:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:256:32:1:l -cache:il1 il1:1024:16:1:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:512:32:1:l -cache:il1 il1:1024:16:1:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:1024:32:1:l -cache:il1 il1:1024:16:1:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:2048:32:1:l -cache:il1 il1:1024:16:1:l -cache:dl2 ul2:256:64:4:l"
	#tasca 3 modificar mida il1
	"-cache:dl1 dl1:64:32:4:l -cache:il1 il1:32:32:1:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:64:32:4:l -cache:il1 il1:64:32:1:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:64:32:4:l -cache:il1 il1:128:32:1:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:64:32:4:l -cache:il1 il1:256:32:1:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:64:32:4:l -cache:il1 il1:512:32:1:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:64:32:4:l -cache:il1 il1:1024:32:1:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:64:32:4:l -cache:il1 il1:2048:32:1:l -cache:dl2 ul2:256:64:4:l"
	#tasca 4 modificar mida dl2
	"-cache:dl1 dl1:64:32:4:l -cache:il1 il1:1024:16:1:l -cache:dl2 ul2:1024:32:1:l"
	"-cache:dl1 dl1:64:32:4:l -cache:il1 il1:1024:16:1:l -cache:dl2 ul2:2048:32:1:l"
	"-cache:dl1 dl1:64:32:4:l -cache:il1 il1:1024:16:1:l -cache:dl2 ul2:4096:32:1:l"
	"-cache:dl1 dl1:64:32:4:l -cache:il1 il1:1024:16:1:l -cache:dl2 ul2:8192:32:1:l"
	"-cache:dl1 dl1:64:32:4:l -cache:il1 il1:1024:16:1:l -cache:dl2 ul2:16384:32:1:l"
	#tasca 5 modificar associatividad dl1
	"-cache:dl1 dl1:128:32:1:l -cache:il1 il1:1024:16:1:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:64:32:2:l -cache:il1 il1:1024:16:1:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:32:32:4:l -cache:il1 il1:1024:16:1:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:16:32:8:l -cache:il1 il1:1024:16:1:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:8:32:16:l -cache:il1 il1:1024:16:1:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:4:32:32:l -cache:il1 il1:1024:16:1:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:2:32:64:l -cache:il1 il1:1024:16:1:l -cache:dl2 ul2:256:64:4:l"
	#tasca 6 modificar associatividad il1
	"-cache:dl1 dl1:64:32:4:l -cache:il1 il1:128:32:1:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:64:32:4:l -cache:il1 il1:64:32:2:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:64:32:4:l -cache:il1 il1:32:32:4:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:64:32:4:l -cache:il1 il1:16:32:8:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:64:32:4:l -cache:il1 il1:8:32:16:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:64:32:4:l -cache:il1 il1:4:32:32:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:64:32:4:l -cache:il1 il1:2:32:64:l -cache:dl2 ul2:256:64:4:l"
	#tasca 7 modificar tamanyo bloque dl1
	"-cache:dl1 dl1:512:8:1:l -cache:il1 il1:1024:16:1:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:256:16:1:l -cache:il1 il1:1024:16:1:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:128:32:1:l -cache:il1 il1:1024:16:1:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:64:64:1:l -cache:il1 il1:1024:16:1:l -cache:dl2 ul2:256:64:4:l"
	#tasca 8 modificar tamanyo de bloque il1
	"-cache:dl1 dl1:64:32:4:l -cache:il1 il1:512:8:1:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:64:32:4:l -cache:il1 il1:256:16:1:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:64:32:4:l -cache:il1 il1:128:32:1:l -cache:dl2 ul2:256:64:4:l"
	"-cache:dl1 dl1:64:32:4:l -cache:il1 il1:64:64:1:l -cache:dl2 ul2:256:64:4:l"
)

mkdir Results
cd Results
> applu.txt
> crafty.txt
> twolf.txt
> gzip.txt
> vortex.txt
cd ..
mkdir Out

> _Resultats

# FASE 1
j=0
for i in ${parameters[@]}; do
	echo ${parameters[$j]}
	echo ${parameters[$j]} >> _Resultats

	echo "Applu" >> _Resultats
	simplesim-3.0_ecx/sim-outorder -fastfwd 50000000 -max:inst 10000000 ${parameters[$j]} -redir:sim Results/applu.txt Benchmarks/applu/exe/applu.exe < Benchmarks/applu/data/ref/applu.in > Out/applu.out 2> Out/applu.err 
	more Results/applu.txt | grep -E miss_rate >> _Resultats

	echo "Crafty" >> _Resultats
	simplesim-3.0_ecx/sim-outorder -fastfwd 50000000 -max:inst 10000000 ${parameters[$j]} -redir:sim Results/crafty.txt Benchmarks/crafty/exe/crafty.exe < Benchmarks/crafty/data/ref/crafty.in > Out/crafty.out 2> Out/crafty.err
	more Results/crafty.txt | grep -E miss_rate >> _Resultats

	echo "Twolf" >> _Resultats
	simplesim-3.0_ecx/sim-outorder -fastfwd 50000000 -max:inst 10000000 ${parameters[$j]} -redir:sim Results/twolf.txt Benchmarks/twolf/exe/twolf.exe Benchmarks/twolf/data/ref/ref > Out/twolf.out 2> Out/twolf.err
	more Results/twolf.txt | grep -E miss_rate >> _Resultats

	echo "Vortex" >> _Resultats
	cd Benchmarks/vortex/data/ref/
	../../../../simplesim-3.0_ecx/sim-outorder -fastfwd 50000000 -max:inst 10000000 ${parameters[$j]} -redir:sim ../../../../Results/vortex.txt ../../exe/vortex.exe lendian1.raw > ../../../../Out/vortex.out 2>  ../../../../Out/vortex.err  
	cd ../../../../
	more Results/vortex.txt | grep -E miss_rate >> _Resultats

	echo "gzip" >> _Resultats
	simplesim-3.0_ecx/sim-outorder ${parameters[$j]} -max:inst 10000000 -fastfwd 50000000 Benchmarks/gzip/exe/gzip.exe Benchmarks/gzip/data/ref/input.source 60 -redir:sim Out/gzip.err > Out/gzip.out 2> Results/gzip.txt
	more Results/gzip.txt | grep -E miss_rate >> _Resultats

	let j=j+1
	if [ "$j" == "43" ]; then
		break
	fi

done
echo "Final fase 1"
rm -f costs.out
rm -f game.001
rm -f nul

exit 0
# FASE 2

parameters2=(
	# ex1
	"-cache:dl1 dl1:64:32:4:l -cache:il1 il1:64:32:4:l -cache:dl2 ul2:64:32:4:l"
)

for i in ${parameters[@]}; do
	


	echo ${parameters[$j]}
	echo \n\n >> _Resultats
	echo ${parameters[$j]} >> _Resultats
	echo \n\n >> _Resultats

	more Results/* | grep -E miss_rate >> _Resultats

done



exit 0

