#!/bin/bash
# Definir o PATH
# export PATH=/usr/local/bin:/usr/bin:/bin:/sbin:/usr/sbin:/root/.local/bin
export PATH=/home/githubti/.local/bin:/usr/local/bin:/usr/bin:/bin:/root/.local/bin

# 1. Captura o nome passado após o comando (ex: ./executar.sh projeto_xyz) "Pega a primeira palavra que o usuário digitar depois do nome do script".
# A variavel $1 vai receber "projeto_xyz"
PROJETO=$1

# 2. Validação: O usuário esqueceu de digitar o nome?
if [ -z "$PROJETO" ]; then
    echo "-------------------------------------------------------"
    echo "ERRO: Você esqueceu de informar o nome do projeto!"
    echo "Uso correto: ./executar.sh projeto_xyz"
    echo "-------------------------------------------------------"
    exit 1
fi

# --- NOVA TRAVA DE SEGURANÇA ---
# Pega o nome da pasta onde o usuário está agora
PASTA_ATUAL=$(basename "$(pwd)")

# Verifica se o nome digitado ($1) é IGUAL ao nome da pasta atual
if [ "$PROJETO" != "$PASTA_ATUAL" ]; then
    echo "------------------------------------------------------------"
    echo "ERRO DE SEGURANÇA: Você tentou executar '$PROJETO'," 
    echo "mas você está dentro da pasta '$PASTA_ATUAL'."
    echo "O nome do projeto deve coincidir com a pasta atual."
    echo "------------------------------------------------------------"
    exit 1
fi
# -------------------------------

# 3. Define o caminho base
# O diretorio tem que ser com mesmo nome do projeto, ex: projeto_xyz
BASE_DIR="/opt/app_github"
DIRETORIO_ESPERADO="$BASE_DIR/$PROJETO"

echo "------------------------------------------"
echo "Iniciando projeto: $PROJETO"
echo "Caminho:           $DIRETORIO_ESPERADO"
echo "------------------------------------------"

# 4. Verifica se o caminho atual é exatamente o que deveria ser
if [ "$(pwd)" != "$DIRETORIO_ESPERADO" ]; then
    echo "ERRO: Este projeto deve ser executado a partir de $DIRETORIO_ESPERADO"
    exit 1
fi

echo "Confirmado: Executando $PROJETO em $DIRETORIO_ESPERADO"

# 5. Executa o main.py com um "Apelido" (Process Name, ex: projeto_xyz)
# Usamos o comando 'exec -a' para dar um nome identificável ao processo no sistema
nice -n 10 uv run $PROJETO.py   # média
