#!/bin/bash

echo "Bienvenido al juego Piedra, Papel y Tijeras!"
echo "Elige una opción (piedra, papel, tijeras)"
read -p "Tu elección: " eleccion

case $eleccion in
piedra|papel|tijeras)
opciones=("piedra" "papel" "tijeras")
num_op=${#opciones[@]}
num=$((RANDOM % num_op))
computadora=${opciones[$num]}
echo "La computadora eligió: $computadora"

if [[ $eleccion == $computadora ]]; then
echo "Empataron jaja, la máquina eligío $eleccion tambien"
elif [ $eleccion == "piedra" ] && [ $computadora == "tijeras" ] || [ $eleccion == "papel" ] && [ $computadora == "piedra" ] || [ $eleccion == "tijeras" ] && [ $computadora == "papel" ]; then
echo "Sos un crack, le ganaste a la maquina porque eligió: $computadora"

else
echo "Te venció la maquina compa porque eligió: $computadora :("
echo "Mejor suerte para la próxima ;)"
fi
;;
*)
echo "Error, elegí una de las opciones disponibles"
;;
esac 
