# -*- coding:utf-8 -*-

"""
Calculadora
Autor: João Paulo Alves
Função: Fazer contas: adição, subtração. multiplicação e divisão
"""

sair = False
operadorvalido = True
#global resultado

print ("------------Calculadora V1.0---------------")

while sair == False:
	num1 =  int(input("Digite um número: "))
	oper =  input("Digite uma operação (+-/*): ")
	num2 =  int(input("Digite outro número: "))

	


	if oper == "+":	
		resultado = (num1 + num2)		
		#operadorvalido = True
		
		
	elif oper == "-":
		resultado = num1 - num2
		#operadorvalido = True
		
	elif oper == "*":
		resultado = num1 * num2
		#operadorvalido = True
		
	elif oper == "/":
		resultado = num1 / num2
		#operadorvalido = True
		
	else :
		print("operador inválido")	
		operadorvalido = False
		  
	while operadorvalido == False:
		oper =  input("Digite uma operação (+-/*): ")
		if oper == "+":	
			resultado = (num1 + num2)
			operadorvalido = True
			
			
		elif oper == "-":
			resultado = num1 - num2
			operadorvalido = True
			
		elif oper == "*":
			resultado = num1 * num2
			operadorvalido = True
			
		elif oper == "/":
			resultado = num1 / num2
			operadorvalido = True
			
		else :
			operadorvalido = False
			print("operador inválido escolha um operador (+-/*)")	
			

	if operadorvalido == True:
		print("Resultado: ")
		print(resultado)


	fechar = (input("Deseja sair do programa? (S/N): "))

	if fechar == "S" or fechar == "s":
		sair = True
	else :
		sair = False

print ("---Esse programa será encerrado!!!---")
print ("------------FIM---------------")


