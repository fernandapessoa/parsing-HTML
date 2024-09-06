#!/bin/bash

# Definindo cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # Sem cor

# Exibe o ASCII do título em cores
echo -e "${GREEN}  _____               _               _    _ _______ __  __ _      "
echo -e " |  __ \             (_)             | |  | |__   __|  \/  | |     "
echo -e " | |__) |_ _ _ __ ___ _ _ __   __ _  | |__| |  | |  | \  / | |     "
echo -e " |  ___/ _\` | '__/ __| | '_ \ / _\` | |  __  |  | |  | |\/| | |     "
echo -e " | |  | (_| | |  \__ \ | | | | (_| | | |  | |  | |  | |  | | |____ "
echo -e " |_|   \__,_|_|  |___/_|_| |_|\__, | |_|  |_|  |_|  |_|  |_|______|"
echo -e "                               __/ |                               "
echo -e "                              |___/                                ${NC}"
echo -e "${YELLOW}                                                   By Fernanda Pessoa${NC}"
echo ""

# Função para exibir a linha separadora
separador() {
    echo -e "${CYAN}====================================================================${NC}"
}

if [ "$1" == "" ]; then
   echo -e "${RED}PARSING HTML${NC}"
   echo -e "${YELLOW}Modo de uso:${NC} $0 DOMINIO"
   echo -e "${YELLOW}Exemplo:${NC} $0 https://www.globo.com/"

else
   echo ""
   separador
   echo ""
   
    echo -e "${GREEN}Procurando...${NC}"
   
   # Apagando arquivos temporários caso existam
   rm -f index response dominios dominio

   # Buscando index.html do domínio passado e salvando na variável dominios
   wget -q $1 -O index
   cat index | grep "href" | cut -d "/" -f3 | grep "\." | sed 's/".*//' | grep -v "<l" | sort | uniq > dominios

   # Busca dos IPs dos domínios
   for dominio in $(cat dominios); do
        host "$dominio" | grep "has address" >> response
   done

   # Mostrar dados no terminal
   echo ""
   separador
   echo "" 
   echo -e "${YELLOW}Line  Dominio                                       IP Address${NC}"
   echo ""
    cat response | sort | uniq | nl -w2 -s'     ' | sed 's/has address//' | awk '{printf "%-5s %-45s %s\n", $1, $2, $3}'

   echo ""
   separador
   echo ""
   echo -e "${GREEN}Processo finalizado.${NC}"

   # Apagando arquivos temporários
   rm -f index response dominios dominio

fi
