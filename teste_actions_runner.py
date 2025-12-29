import time
import sys

# Pega o nome do projeto (opcional, apenas para o print)
nome_projeto = sys.argv[0]

print(f"--- Iniciando teste do projeto: {nome_projeto} ---")
print(f"Codigo anterado, teste final. Junto com Gabriel...")
print(f"printando mais uma linha para teste de commit...")

for i in range(30, 0, -1):
    print(f"Rodando... {i} segundos restantes", end="\r")
    time.sleep(1)

print("\n--- Teste finalizado com sucesso! ---")