#!/bin/bash

# Função para exibir o título
exibirTitulo(){
echo "
   ___          _   ___                ___            
  / __|  _  _  (_) |   \   ___  __ __ / __|  ___   __ 
 | (_ | | || | | | | |) | / -_) \ V / \__ \ / -_) / _|
  \___|  \_,_| |_| |___/  \___|  \_/  |___/ \___| \__|
                                                                                 
	
        Script de Automação de Instalação de ambiente de produção
	Desenvolvido por Guilherme Henrique de Sousa Jesus
	Email para contato: guilherme.devsec@hotmail.com
       "
}

# Exibe título inicial
exibirTitulo

# Verificar se o script está sendo executado como superusuário
if [ "$(id -u)" != "0" ]; then
    echo "Este script precisa ser executado como superusuário."
    exit 1
fi

# Atualização dos pacotes
echo "Atualizando os pacotes ...."
apt update > /dev/null

# Instalação de NodeJS
echo "Verificando se o NodeJs está instalado ..."
if command -v nodejs > /dev/null 2>&1; then
   echo "NodeJS já está instalado"
else
   echo "Instalando o NodeJS"
   apt-get install nodejs -y > /dev/null
   echo "NodeJS Instalado"

   # Instalação de npm (adicionado)
   apt-get install npm -y > /dev/null
   echo "npm Instalado"
fi

# Instalação de Java
echo "Verificando se o Java está instalado ..."
if command -v java > /dev/null 2>&1; then
   echo "Java já está instalado"
else
   echo "Instalando o Java"
   apt-get install default-jdk -y > /dev/null
   echo "Java Instalado"
fi

# Instalação do Docker
echo "Verificando se o Docker está instalado ..."
if command -v docker.io > /dev/null 2>&1; then
    echo "Docker já está instalado"
else
    echo "Instalando o Docker"
    apt-get install docker.io -y > /dev/null
    echo "Docker Instalado"
fi

# Instalação do Git
echo "Verificando se o Git está instalado ..."
if command -v git > /dev/null 2>&1; then
   echo "Git já está instalado"
else
   echo "Instalando o Git"
   apt-get install git -y > /dev/null
   echo "Git Instalado"
fi

echo "Instalação finalizada. Obrigado por utilizar o script."
