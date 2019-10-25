*** Settings ***
Documentation    Exemplo de uso de variáveis em argumentos na keywords

*** Variables ***
&{PESSOA}        nome=João Paulo   email=joaopgioio@gmail.com   idade=12   sexo=masculino

*** Test Case ***
Caso de teste de exemplo 01
    Uma keyword qualquer 01

*** Keywords ***
Uma keyword qualquer 01
    Uma subkeyword com argumentos   ${PESSOA.nome}  ${PESSOA.email}
    ${MENSAGEM_ALERTA}  Uma subkeyword com retorno  ${PESSOA.nome}  ${PESSOA.idade}
    Log  ${MENSAGEM_ALERTA}

Uma subkeyword com argumentos
    [Arguments]     ${NOME_USUARIO}  ${EMAIL_USUARIO}
    Log             Nome Usuário: ${NOME_USUARIO}
    Log             Email: ${EMAIL_USUARIO}

Uma subkeyword com retorno
    [Arguments]     ${NOME_USUARIO}  ${IDADE_USUARIO}
    ${MENSAGEM}     Set Variable If  ${IDADE_USUARIO}<18   Não autorizado! O usuário ${NOME_USUARIO} é menor de idade!
    [Return]        ${MENSAGEM}
