#!/bin/bash

#################################################################################
#                                                                               #
# Nome: gerabackuphome.sh							#
#										#
# Autor: Carlos Henrique Rezende Silva (carlos.professionalti@gmail.com)	#
# Data: 16/12/2017								#
#										#
# Descrição: Crie um script que faça o backup do diretorio /home/carlos 	#
#            									#
#										#
# Uso: source gerabackuphome.sh ou ./gerabackuphome.sh				#
#										#	
#################################################################################


HOMEBKP=/home/carlos/
DIRBKP=/mnt/Backup/
DATE=$(date +%Y-%m-%d-%H-%M)
NAME=backup_home_$DATE.tgz
DAY7=$(find $DIRBKP -ctime -7 -name backup_home\*tgz) #Atenção na proteção do *

# Testa se o diretorio /home/carlos/Backup existe, senão existir crie o diretorio
clear
echo "Inicializando .... "
sleep 2
if test -d $DIRBKP
then
	echo "O diretorio $DIRBKP já existe"
else
	echo "O diretorio $DIRBKP não existe"
	echo "O diretorio $DIRBKP será criado .... $(mkdir -p $DIRBKP)"
	sleep 2
	echo "Diretorio criado com sucesso! $DIRBKP"
fi

# Consulta se existe algum arquivo de backup criado na última semana.
if [ "$DAY7" ] #Testa se a variável é nula. Atenção nas aspas duplas
then
	echo "já foi gerado um backup do diretório $HOMEBKP nos últimos 7 dias."
	echo -n "Deseja continuar? (N/s): "
	read -n2 CONT
	echo ""
		if [ "$CONT" = N -o "$CONT" = n -o "$CONT" = "" ]
		then
			echo "Backup abortado!"
			exit 1
		elif [ $CONT = S -o $CONT = s ]
		then
			echo "Será criado mais um backup para a mesma semana"
		else
			echo "Opção Inválida"
			exit 2
		fi
fi

# Acessando o diretorio /home/carlos/Backup
echo ""
echo "Acessando o diretorio .... $DIRBKP"
sleep 3
cd $DIRBKP

# Empacotando e compactando o /home/carlos com tar e gzip
echo ""
echo "Criando o Backup .... "
sleep 3
tar zcvf $NAME $HOMEBKP --absolute-names --exclude="$DIRBKP"

# Finalizando o Backup
echo ""
echo "O Backup de nome \""$NAME"\" foi criado em $DIRBKP"
echo ""
echo "Backup Concluído!"
echo ""
echo "Retornando ao Diretorio Anterior .... "
cd -
echo ""
