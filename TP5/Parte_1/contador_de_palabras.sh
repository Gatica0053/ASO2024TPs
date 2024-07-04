#!/bin/bash

echo "Bienvenido! Este programa calculará la cantidad de palabras, líneas y carácteres que hay en su archivo de texto"
echo "Coloque su archivo de texto"
echo -n "Nombre del archivo: "
read archivo

if [ -z "$archivo" ]; then
echo "Error, nombre de archivo inválido"
exit 1
fi

if [ ! -f  "$archivo" ]; then
echo "El archivo $archivo  no se a encontrado"
exit 1
fi

cant_palabras=0
cant_lineas=0
cant_caracteres=0

while IFS= read -r linea; do
((cant_lineas++))
palabras=($linea)
cant_palabras=$((cant_palabras + ${#palabras[@]}))
cant_caracteres=$((cant_caracteres + ${#linea}))
done < "$archivo"

echo "El archivo $archivo contiene..."
echo "$cant_palabras palabras"
echo "$cant_lineas líneas"
echo "Y $cant_caracteres carácteres" 
echo ":)"
