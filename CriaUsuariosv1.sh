#!/bin/bash

#################################################################################
#                                                                               #
# Nome: CriaUsuariosv1.sh							#
#										#
# Autor: Carlos Henrique Rezende Silva (carlos.professionalti@gmail.com)	#
# Data: 19/12/2017								#
#										#
# Descrição: Crie um script que faça criação de usuarios no sistema linux 	#
#            									#
#										#
# Uso: source CriaUsuariosv1.sh ou ./CriaUsuariosv1.sh				#
#										#	
#################################################################################

clear
echo ""
echo ""$0" - Script para criação de novos usuários no Linux ...."
echo ""
read -p "Digite nome de Login do novo usuário: " USUARIO
read -p "Digite nome completo do Usuário: " NOME
read -p "Digite o nome do Shell de sua preferência: " USERSHELL

echo ""
echo "Criando o usuário ...."
sleep 2 
useradd $USUARIO -c "$NOME" -m -s "$USERSHELL"
echo "Usuário criado com Sucesso!"

#Criando o cabeçalho de saida
echo ""
echo -e "USUARIO\t\tNOME OU DESCRIÇÃO\t\tSHELL PADRÃO"
echo -e "$USUARIO\t\t$NOME\t\t$USERSHELL"

echo ""

read -p "Deseja cadastrar uma senha para o novo usuário criado? (N/s):" OPCAO

	if [ $OPCAO = S -o $OPCAO = s ]
	then
		passwd $USUARIO
	
	elif [ $OPCAO = N -o $OPCAO = n ] 
	then
		echo "Você optou por não cadastrar uma nova senha para o usuário $USUARIO"
	
	else
		echo "Opção Inválida! você deve escolher Sim ou Não" 
		
	fi

echo ""
echo "Operação Concluída!"


