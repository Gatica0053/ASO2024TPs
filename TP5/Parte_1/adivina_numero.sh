#!/bin/bash

numero=$((RANDOM % 100 + 1))

echo "Bienvenido al juego Adivina el Número"
echo "Intenta adivinar el número entre 1 y 100 >:)"

while true; do
read -p "Ingresa tu número: " guess

if ! [[ $guess =~ ^[0-9]+$ ]]; then
echo "El número ingresado no es válido."
continue
fi

if (( guess > $numero )); then
echo "El número que ingresaste es muy alto... Intenta otra vez"
elif (( guess < $numero )); then
echo "El número que ingresaste es muy bajo... Intenta otra vez"
else
echo "Felicidades! Encontraste el número :)"
break
fi

done
