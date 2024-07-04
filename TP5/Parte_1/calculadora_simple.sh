#!/bin/bash

echo "Bienvenido a la calculadora simple!"
read -p "Coloque el primer valor: " num1
read -p "Coloque el segundo valor: " num2

echo "Ahora elija el tipo de operación que desea realizar"
echo "1_ Sumar"
echo "2_ Restar"
echo "3_ Multiplicar"
echo "4_ Dividir"
read -p "Su opción (1-4): " opcion

case $opcion in
1)
resultado=$(echo "$num1 + $num2" | bc)
echo "El resultado de la suma es: $resultado"
;;
2)
resultado=$(echo "$num1 - $num2" | bc)
echo "El resultado de tu resta es: $resultado"
;;
3)
resultado=$(echo "$num1 * $num2" | bc)
echo "El resultado de tu multiplicación es: $resultado"
;;
4)
if [ $num2 -eq 0 ]; then
echo "Error, no se puede dividir entre 0"
else
resultado=$(echo "scale=2; $num1 / $num2" | bc)
echo "El resultado de tu división es: $resultado"
fi
;;
*)
echo "Error, coloque una opción válida"
;;
esac
