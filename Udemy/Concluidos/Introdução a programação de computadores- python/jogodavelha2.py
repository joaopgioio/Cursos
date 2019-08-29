# -*- coding:utf-8 -*-

#    ===Smart School===
# Jogo da Velha 

# Libs do Python
import random, os

# variaveis globais

Limpa = "os.system('cls' if os.name == 'nt' else 'clear')"
jogando = 'X'
X       = 0
O       = 0
em      = 0
V       = [
		
	[1,2,3],
	[4,5,6],
	[7,8,9]
]



# ===========================Interface====================================

def cabecalho():
	print("|===============================================================|")
	print("|                Jogo da Velha Com Python                       |")
	print("|===============================================================|")

def placar():
	print("|                          Placar                               |")
	print("|          ( O ) => "+str(O)+"                     "+str(X)+" <= ( X )            |")
	print("|          Empates => "+str(em)+"                                         |")
	print("|===============================================================|")
	print("|                         Jogando => "+str(jogando)+"                          |")
	print("|===============================================================|")

def velha():
	print("|                    +-----+-----+-----+                        |")
	print("|                    |  "+str(V[0][0])+"  |  "+str(V[0][1])+"  |  "+str(V[0][2])+"  |                        |")
	print("|                    +-----+-----+-----+                        |")
	print("|                    |  "+str(V[1][0])+"  |  "+str(V[1][1])+"  |  "+str(V[1][2])+"  |                        |")
	print("|                    +-----+-----+-----+                        |")
	print("|                    |  "+str(V[2][0])+"  |  "+str(V[2][1])+"  |  "+str(V[2][2])+"  |                        |")
	print("|                    +-----+-----+-----+                        |")
	print("|-------------------------------------------------------------- |")


# Funcoes auxiliares

def jogador(): # Escolha o jogador

	return 'X' if random.randint(1, 2) == 1 else 'O'

def jogou(msg):

	while True:
		try:
			jogada = input(msg)
			return int(jogada[0])
		except:
			print("Certifique-se de que digitou um valor aceito!")

def questao(msg, erro="Digite S para sim e N para não"):

	while True:
		try:
			r = input(msg) 
			if ( r[0] == 'S' or r[0] == 's'):
				return True
			elif ( r[0] == 'N' or r[0] == 'n'):
				return False
			else:
				print(erro)
		except:
			print("Certifique-se de que digitou um valor aceito!")

#########################################################################################

Inicio = True

while Inicio:
	jogando = jogador()
	GameOn = True

	while GameOn:

		#Cabecalho

		eval(Limpa); cabecalho(); placar(); velha()

		jogada = jogou("Jogue o numero da posicao que deseja: ")

		# Validacao

		jogadaAceita = False

		for i in range(3):
			for j in range(3):
				if jogada == V[i][j]:
					V[i][j] = jogando
					jogadaAceita = True

		if not questao("Continua? "):


			GameOn = False
			Inicio = False

print(jogador())
print(jogou('Joga na Posicao: 1-9: '))
print(questao("Quer jogar mais? "))




	