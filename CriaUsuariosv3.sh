#!/bin/bash

#################################################################################
#                                                                               #
# Nome: CriaUsuariosv3.sh							#
#										#
# Autor: Carlos Henrique Rezende Silva (carlos.professionalti@gmail.com)	#
# Data: 21/12/2017								#
#										#
# Descrição: Crie um script que faça criação de usuarios no sistema linux 	#
#            									#
#										#
# Uso: source CriaUsuariosv3.sh ou ./CriaUsuariosv3.sh				#
#										#	
#################################################################################

clear
echo ""
echo ""$0" - Script para criação de novos usuários no Linux ...."
echo ""
read -p "Digite nome de Login para o novo usuário: " USUARIO
read -p "Digite o nome completo do novo usuário: " NOME

echo ""
echo "Verificando se o usuário já existe no sistema ...."
sleep 2

if FILTRO=$(grep $USUARIO /etc/passwd | cut -d":" -f1)
then
		if [ "$USUARIO" = "$FILTRO" ] 
		then
		
			echo "Usuário já existe no sistema ...."
			echo "Finalizando o sistema ...."
			exit 1
			
		else
			echo ""
			echo "Usuário não existe no sistema, será criado agora ...."
			echo ""
		fi

fi

read -p "Deseja Criar o diretório HOME para o novo usuário? (S/n): " HOMEUSER

	if [ $HOMEUSER = S -o $HOMEUSER = s ] 
	then
		echo ""
		echo "Criando o usuário no sistema com diretório home padrão ...."
		useradd $USUARIO -c "$NOME" -m
		echo ""
		echo "Usuário criado com Sucesso!"
	elif [ $HOMEUSER = N -o $HOMEUSER = n ]
	then
		echo ""
		echo "Criando o usuário no sistema ...."
		echo "Diretório home padrão não será criado ...."
		useradd $USUARIO -c "$NOME"
		echo ""
		echo "Usuário criado com Sucesso!"
	else

		echo ""
		echo "Opção Inválida!"
		echo "Finalizando o Sistema ...."
		exit 2
	fi


echo ""
echo "Escolha um Shell de sua preferência: "
echo ""
echo " 1 - /bin/sh "
echo " 2 - /bin/dash "
echo " 3 - /bin/bash "
echo " 4 - /bin/rbash "
echo " 5 - /bin/ksh "
echo " 6 - /bin/zsh "
echo " 7 - Sem Shell "
echo ""
read -p "Selecione uma das opções: " SHELLUSER

	case $SHELLUSER in
			1)
				SHELLUSER=$(usermod -s /bin/sh $USUARIO)
				;;
			2)
				SHELLUSER=$(usermod -s /bin/dash $USUARIO)
				;;
			3)
				SHELLUSER=$(usermod -s /bin/bash $USUARIO)
				;;
			4)
				SHELLUSER=$(usermod -s /bin/rbash $USUARIO)
				;;
			5)
				SHELLUSER=$(usermod -s /bin/ksh $USUARIO)
				;;
			6)
				SHELLUSER=$(usermod -s /bin/zsh $USUARIO)
				;;
			7)
				SHELLUSER=$(usermod -s /bin/false $USUARIO)
				;;
			*)
				echo "Opção Inválida!"
				;;
	esac

# Váriaveis SHELLUSER e HOMEUSER recebem um novo valor
SHELLUSER=$(grep $USUARIO /etc/passwd | cut -d":" -f7)

if [ $HOMEUSER = S -o $HOMEUSER = s ] 
then

	HOMEUSER=$(grep $USUARIO /etc/passwd | cut -d":" -f6)


elif [ $HOMEUSER = N -o $HOMEUSER = n ]
then

	HOMEUSER="Não foi criado"

fi

#Criando o cabeçalho de saida
echo ""
echo -e "USUARIO\t\t       NOME\t\t        SHELL PADRÃO\t\t   HOME PADRÃO"
echo -e "$USUARIO\t\t$NOME\t\t$SHELLUSER\t\t$HOMEUSER"

echo ""
read -p "Deseja cadastrar uma senha para o novo usuário criado? (S/n):" OPCAO

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
echo ""
