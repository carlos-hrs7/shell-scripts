#!/bin/bash

#################################################################################
#                                                                               #
# Nome: relatoriomaquina.sh							#
#										#
# Autor: Carlos Henrique Rezende Silva (carlos.professionalti@gmail.com)	#
# Data: 15/12/2017								#
#										#
# Descrição: Crie um script que gere um relatório de algumas 			#
#            informações da máquina atual					#
#										#
# Uso: source relatoriomaquina.sh ou ./relatoriomaquina.sh			#
#										#	
#################################################################################

clear
echo ""
echo " ============= Relátorio da Máquina =================================== "
echo ""
echo " ====================================================================== "
echo ""
echo " Nome da Máquina: $HOSTNAME "
echo " Data e Hora Atuais: `date` "
echo ""
echo " ====================================================================== "
echo ""
#echo " Máquina ativa desde: `who |tr -s " "|cut -d" " -f3,4` "
echo " Máquina ativa desde: `uptime -s` "
echo " Tempo da Máquina Ativa: `uptime -p` "
echo ""
echo " ====================================================================== "
echo ""
echo " Versão do Kernel: $(uname -r) "
echo ""
echo " ====================================================================== "
#Declarando Variaveis
QTCPU=$(grep -c "cpu cores" /proc/cpuinfo)
MODELCPU=$(cat /proc/cpuinfo | grep "model name" | tr -s "^I" | cut -d":" -f2)
MEMTOTAL=$(expr $(cat /proc/meminfo | grep MemTotal | tr -d ' '| cut -d: -f2 | tr -d kB) / 1024) #Em MB
echo ""
echo " CPUs: "
echo " Quantidade de CPUs/Core: $QTCPU "
echo " Modelo da CPU:$MODELCPU "
echo ""
echo " Memória Total: $MEMTOTAL MB"
echo ""
echo " ====================================================================== "
echo ""
echo " Partições do Sistema: "
echo ""
#Variavel do filesystem
FILESYS=$(df -hT | egrep -v '(tmpfs|udev)') # remove da expressão o tmpfs e udev
echo " $FILESYS "
echo ""
echo " ====================================================================== "
echo ""
echo " ============= FIM DO SCRIPT ========================================== "
echo ""
