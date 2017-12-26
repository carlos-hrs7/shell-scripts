#!/bin/bash

#Crie um algoritmo para verificar se o usuario esta apto a dirigir
clear
echo ""
echo "=========================="
echo " DEPARTAMENTO DE TRANSITO "
echo "=========================="

echo ""
read -p "Ano atual (yyyy): " ano_atual
read -p "Ano de Nascimento (yyyy): " ano_nascimento
echo ""
idade=$(expr $ano_atual - $ano_nascimento)

	if [ $idade -ge 18 ]
	then
		echo "---------- STATUS ----------"
		echo "IDADE: $idade"
		echo "APTO A TIRAR A CARTEIRA CNH "
		echo "----------------------------"
	else	
		echo "---------- STATUS -------------------"
		echo "IDADE $idade"
		echo "NÃO ESTA APTO A TIRAR A CARTEIRA CNH"
		echo "-------------------------------------"
	fi

echo ""
echo "Fim do Script"
echo ""

