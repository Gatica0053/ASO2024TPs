#!/bin/bash

API_KEY="d079c5af2e0a401d84e221311242206"
API_URL="https://www.weatherapi.com/v1/current.xml"
echo "Bienvenido al programa Clima Actual de weatherapi.com :)"
read -p "Coloque el nombre de su ciudad: " ciudad
respuesta=$(curl -s "$API_URL?key=$API_KEY&q=$ciudad")
if [ $? -ne 0 ]; then
echo "Error, no se pudo conectar a la API. Volve a intentar más tarde"
exit 1
fi
error=$(echo "$respuesta" | jq -r '.error.code')
if [ ! -z "$error" ] && [ "$error" != "null" ]; then
mensaje_error=$(echo "$respuesta" | jq -r '.error.menssage')
echo "Error, $mensaje_error"
exit 1
fi
ciudad=$(echo "$respuesta" | jq -r '.location.name')
temperatura=$(echo "$respuesta" | jq -r '.current.temp_c')
condicion=$(echo "$respuesta" | jq -r '.current.condition.text')
echo "El clima actual en: $ciudad"
echo "- Temperatura: $temperatura"
echo "- Condición: $condicion"
