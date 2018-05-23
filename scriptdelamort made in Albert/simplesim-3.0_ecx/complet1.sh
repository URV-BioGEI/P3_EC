mkdir ../fase1
mkdir ../sortida

#tarea 2 
./excel.py dl1 7 32:32:1:l    64:32:1:l  128:32:1:l  256:32:1:l  512:32:1:l  1024:32:1:l 2048:32:1:l
mv ../sortida/ ../fase1/sortida2

#tarea 3
./excel.py il1 7 32:32:1:l  64:32:1:l 128:32:1:l 256:32:1:l  512:32:1:l   1024:32:1:l   2048:32:1:l
mv ../sortida/ ../fase1/sortida3

#tarea 4
./excel.py ul2 5 1024:32:1:l   2048:32:1:l   4096:32:1:l    8192:32:1:l   16384:32:1:l 
mv ../sortida/ ../fase1/sortida4

#tarea 5
./excel.py dl1 7 128:32:1:l 64:32:2:l 32:32:4:l 16:32:8:l 8:32:16:l 4:32:32:l 2:32:64:l 
mv ../sortida/ ../fase1/sortida5

#tarea 6
./excel.py il1 7 128:32:1:l 64:32:2:l 32:32:4:l 16:32:8:l 8:32:16:l 4:32:32:l 2:32:64:l
mv ../sortida/ ../fase1/sortida6

#tarea 7
./excel.py dl1 4 512:8:1:l   256:16:1:l   128:32:1:l   64:64:1:l   
mv ../sortida/ ../fase1/sortida7

#tarea 8
./excel.py il1 4  512:8:1:l  256:16:1:l  128:32:1:l  64:64:1:l
mv ../sortida/ ../fase1/sortida8
