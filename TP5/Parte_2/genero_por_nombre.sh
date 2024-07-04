#!/bin/bash

API_URL="https://api.genderize.io/?name=nombre"

echo "Bienvenido al programa de detección de género por nombre :)"
read -p "Coloque un nombre: " nombre

respuesta=$(curl -s "$API_URL$nombre")

if [ $? -ne 0 ]; then
echo "Error en la API, intente más tarde"
exit 1
fi

genero=$(echo $respuesta | jq -r '.gender')

if [ "$genero" == "null" ]; then
echo "No se pudo determinar el género para el nombre $nombre"
else
echo "El género para $nombre es: $genero"
fi
