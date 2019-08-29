# -*- coding:utf-8 -*-

"""
Calculadora
Autor: João Paulo Alves
Função: Fazer contas: adição, subtração. multiplicação e divisão
"""
class calc:
	sair = False
	operadorvalido = True

	#global resultado

	print ("------------Calculadora V2.0---------------")
	print ("-                                         -")
	print ("-           Operaçoes(+-/*)               -")
	print ("-           (1) - Adição                  -")
	print ("-           (2) - Subtração               -")
	print ("-           (3) - Divisão                 -")
	print ("-           (4) - Multiplicação           -")
	print ("-------------------------------------------")

	while sair == False:
		def digitar():
			global num1
			global num2
			num1 =  int(input("Digite um número: "))
			num2 =  int(input("Digite outro número: "))
			#return num1, num2

		
		oper =  input("Digite uma operação (1/2/3/4): ")


		if oper == "1":	
			operadorvalido = True
			print("Será feita uma Adição!!!")	
			digitar()
			resultado = (num1 + num2)

		elif oper == "2":
			operadorvalido = True
			print("Será feita uma Subtração!!!")	
			digitar()
			resultado = (num1 - num2)
			
		elif oper == "3":
			operadorvalido = True
			print("Será feita uma Divisão!!!")	
			digitar()
			resultado = (num1 / num2)
			
		elif oper == "4":
			operadorvalido = True
			print("Será feita uma Multiplicação!!!")	
			digitar()
			resultado = (num1 * num2)
			
		else :
			print("operador inválido")	
			operadorvalido = False
			  
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


