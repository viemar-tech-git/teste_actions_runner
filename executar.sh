#!/bin/bash

# 1. Captura o nome do projeto passado por argumento
# Se você rodar: ./executar.sh projeto_xyz "Pegue a primeira palavra que o usuário digitar depois do nome do script".
# A variavel $1 vai receber "projeto_xyz"
PROJETO=$1

# 2. Define o caminho base onde ficam seus projetos
# O diretorio tem que ser com memso nome do projeto, ex: projeto_xyz
BASE_DIR="/opt"
DIRETORIO_PROJETO="$BASE_DIR/$PROJETO"

# 3. Validação: O usuário passou o nome do projeto?
if [ -z "$PROJETO" ]; then
    echo "Erro: Você precisa informar o nome da pasta do projeto."
    echo "Exemplo: ./executar.sh projeto_xyz"
    exit 1
fi

# 4. Entra no diretório dinamicamente
cd "$DIRETORIO_PROJETO" || { echo "Pasta $DIRETORIO_PROJETO não encontrada"; exit 1; }

# 5. Executa o main.py com um "Apelido" (Process Name)
# Usamos o comando 'exec -a' para dar um nome identificável ao processo no sistema
exec -a "PYTHON_$PROJETO" nice -n 10 uv run main.py
