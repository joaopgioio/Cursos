*** Settings ***
Documentation    Exemplo de tipos de variáveis SIMPLES, LISTAS e DICIONÁRIOS

*** Variable ***
#SIMPLES
${GLOBAL_SIMPLES}    Vamos ver os tipos de variáveis no robot!

#Tipo Lista
@{FRUTAS}            morango  banana  maça  uva  abacaxi

#Tipo Dicionário
&{PESSOA}            nome=João Paulo   email=joaopgioio@gmail.com   idade=34   sexo=masculino

*** Test Case ***
Caso de teste de exemplo 01
    Uma keyword qualquer 01

*** Keywords ***

Uma keyword qualquer 01
    #SIMPLES
    Log    ${GLOBAL_SIMPLES}
    #lista
    Log    Tem que ser maça: ${FRUTAS[2]} e Essa tem que ser morango: ${FRUTAS[0]}
    #Dicionario
    Log    Nome: ${PESSOA.nome} e email: ${PESSOA.email}
