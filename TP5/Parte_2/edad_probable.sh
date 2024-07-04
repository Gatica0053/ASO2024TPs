#!/bin/bash

API_URL="https://api.agify.io/?name=nombre"

echo "Bienvenido al programa que devuelve la probabilidad de edad por un nombre :)"
read -p "Coloque un nombre: " nombre

respuesta=$(curl -s "$API_URL$nombre")

if [ $? -ne 0 ]; then
echo "Error, conexión fallida con la API. Vuelva más tarde"
exit 1
fi

edad=$(echo "$respuesta" | jq -r ".age")

if [ "$edad" == "null" ]; then
echo "Error, no se pudo calcular la edad de: $nombre"
else
echo "La edad probable de $nombre es: $edad"
fi
