##############################################################################
# Parte do livro Introdução à Programação com Python
# Autor: Nilo Ney Coutinho Menezes
# Editora Novatec (c) 2010-2017
# Primeira edição - Novembro/2010 - ISBN 978-85-7522-250-8
# Primeira reimpressão - Outubro/2011
# Segunda reimpressão - Novembro/2012
# Terceira reimpressão - Agosto/2013
# Segunda edição - Junho/2014 - ISBN 978-85-7522-408-3
# Primeira reimpressão - Segunda edição - Maio/2015
# Segunda reimpressão - Segunda edição - Janeiro/2016
# Terceira reimpressão - Segunda edição - Junho/2016
# Quarta reimpressão - Segunda edição - Março/2017
#
# Site: http://python.nilo.pro.br/
#
# Arquivo: exercicios\capitulo 07\exercicio-07-10.py
##############################################################################

#
# Jogo da Velha
#

# O tabuleiro
velha="""               Posições
   |   |      7 | 8 | 9
---+---+---  ---+---+---
   |   |      4 | 5 | 6
---+---+---  ---+---+---
   |   |      1 | 2 | 3
"""
# Uma lista de posições (linha e coluna) para cada posição válida do jogo
# Um elemento extra foi adicionado para facilitar a manipulação
# dos índices e para que estes tenham o mesmo valor da posição
#
#  7 | 8 | 9
# ---+---+---
#  4 | 5 | 6
# ---+---+---
#  1 | 2 | 3

posições = [
       None,  # Elemento adicionado para facilitar índices
      (5, 1), # 1
      (5, 5), # 2
      (5, 9), # 3
      (3, 1), # 4
      (3, 5), # 5
      (3, 9), # 6
      (1, 1), # 7
      (1, 5), # 8
      (1, 9), # 9
    ]

# Posições que levam ao ganho do jogo
# Jogadas fazendo uma linha, um coluna ou as diagonais ganham
# Os números representam as posições ganhadoras
ganho = [
          [ 1, 2, 3], # Linhas
          [ 4, 5, 6],
          [ 7, 8, 9],
          [ 7, 4, 1], # Colunas
          [ 8, 5, 2],
          [ 9, 6, 3],
          [ 7, 5, 3], # Diagonais
          [ 1, 5, 9]
        ]

# Constroi o tabuleiro a partir das strings
# gerando uma lista de listas que pode ser modificada
tabuleiro = []
for linha in velha.splitlines():
    tabuleiro.append(list(linha))

jogador = "X" # Começa jogando com X
jogando = True
jogadas = 0 # Contador de jogadas - usado para saber se velhou
while True:
    for t in tabuleiro:  # Imprime o tabuleiro
        print("".join(t))
    if not jogando: # Termina após imprimir o último tabuleiro
        break
    if jogadas == 9: # Se 9 jogadas foram feitas, todas as posições já foram preenchidas
        print("Deu velha! Ninguém ganhou.")
        break
    jogada = int(input("Digite a posição a jogar 1-9 (jogador %s):" % jogador))
    if jogada<1 or jogada>9:
        print("Posição inválida")
        continue
    # Verifica se a posição está livre
    if tabuleiro[posições[jogada][0]][posições[jogada][1]] != " ":
        print("Posição ocupada.");
        continue
    # Marca a jogada para o jogador
    tabuleiro[posições[jogada][0]][posições[jogada][1]] = jogador
    # Verfica se ganhou
    for p in ganho:
        for x in p:
            if tabuleiro[posições[x][0]][posições[x][1]] != jogador:
                break
        else: # Se o for terminar sem break, todas as posicoes de p pertencem ao mesmo jogador
            print("O jogador %s ganhou (%s): "%(jogador, p))
            jogando = False
            break
    jogador = "X" if jogador == "O" else "O" # Alterna jogador
    jogadas +=1 # Contador de jogadas

# Sobre a conversão de coordenadas:
# tabuleiro[posições[x][0]][posições[x][1]]
#
# Como tabuleiro é uma lista de listas, podemos acessar cada caracter
# especificando uma linha e uma coluna. Para obter a linha e a coluna, com base
# na posição jogada, usamos a lista de posições que retorna uma tupla com 2 elementos:
# linha e coluna. Sendo linha o elemento [0] e coluna o elemento [1].
# O que estas linhas realizam é a conversão de uma posição de jogo (1-9)
# em linhas e colunas do tabuleiro. Veja que neste exemplo usamos o tabuleiro como
# memória de jogadas, além da exibição do estado atual do jogo.