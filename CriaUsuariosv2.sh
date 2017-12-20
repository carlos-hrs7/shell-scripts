#!/bin/bash

#################################################################################
#                                                                               #
# Nome: CriaUsuariosv2.sh							#
#										#
# Autor: Carlos Henrique Rezende Silva (carlos.professionalti@gmail.com)	#
# Data: 20/12/2017								#
#										#
# Descrição: Crie um script que faça criação de usuarios no sistema linux 	#
#            									#
#										#
# Uso: source CriaUsuariosv2.sh ou ./CriaUsuariosv2.sh				#
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
			exit 2
			
		else
			echo ""
			echo "Usuário não existe no sistema, será criado agora ...."
			echo ""
			echo "Criando o usuário ...."
			useradd $USUARIO -c "$NOME" -m 
			echo ""
			echo "Usuário criado com Sucesso!"
		fi

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
read -p "Selecione uma das opções: " USERSHELL

	case $USERSHELL in
			1)
				USERSHELL=$(usermod -s /bin/sh $USUARIO)
				;;
			2)
				USERSHELL=$(usermod -s /bin/dash $USUARIO)
				;;
			3)
				USERSHELL=$(usermod -s /bin/bash $USUARIO)
				;;
			4)
				USERSHELL=$(usermod -s /bin/rbash $USUARIO)
				;;
			5)
				USERSHELL=$(usermod -s /bin/ksh $USUARIO)
				;;
			6)
				USERSHELL=$(usermod -s /bin/zsh $USUARIO)
				;;
			7)
				USERSHELL=$(usermod -s /bin/false $USUARIO)
				;;
			*)
				echo "Opção Inválida!"
				;;
	esac

USERSHELL=$(grep $USUARIO /etc/passwd | cut -d":" -f7)
#Criando o cabeçalho de saida
echo ""
echo -e "USUARIO\t\t       NOME\t\t        SHELL PADRÃO"
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
echo ""
