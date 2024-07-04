#!/bin/bash

echo "Bienvenido al programa Cronómetro!"
echo "Para Iniciar/Detener el cronómetro pulse la tecla Enter"
echo "Para Reiniciar pulse la tecla R"
echo "Para Salir pulse la tecla Q"

tiempo=0
empezar=0

while true; do
read -rsn1 opcion

case $opcion in
"")
empezar=$((1-empezar))
if [ $empezar -eq 1 ]; then
while [ $empezar -eq 1 ]; do
printf "\rTiempo transcurrido: %02d segundos" $tiempo
sleep 1
((tiempo++))
read -rsn1 -t 0.1 detener
if [ "$detener" == "" ]; then
empezar=0
fi
done
fi
;;
"R" | "r")
tiempo=0
empezar=0
echo -ne "\nEl Cronómetro se ha reiniciado\n"
;;
"Q" | "q")
echo -ne "\nBye Bye :)\n"
exit 0
;;
*)
echo "Error, opción inválida"
echo "Coloque una de las opciones que aparecen en consola por favor"
;;
esac
done
