*** Settings ***
Documentation       Suite para exemplificar o uso de Loops nos teste
...                 Os Loops devem ser um pouco utilizado, mas tem hora que não tem jeito
...                 e precisamso dele mesmo, então vamos ver como é
...                 Loops: use com moderação!
...                 Infelizmente o Loop FOR ainda não tem uma estrutura Keyword-driven
...                 Mas o criador do Robot já disse que estão estudando uma solução!

*** Variables ***
@{FRUTAS}           maça  banana  uva  abacaxi

*** Test Case ***
Caso de teste exemplo 01
    Usando FOR com RANGE
    Usando FOR com LISTA
    Saindo de um FOR
    Usando a Keyword REPEAT

*** Keywords ***
Usando FOR com RANGE
    : FOR     ${COUNT}     IN RANGE     1      6
    \    Log    Meu contador atual é: ${COUNT}. O range será de 1 a 5!
    \    Run Keyword If    ${COUNT} == 5    Log     Acabou o loop!!!

Usando FOR com LISTA
    : FOR    ${ITEM}       IN      @{FRUTAS}
    \    Log    Minha fruta é: ${ITEM}
    \    Run Keyword If    '${ITEM}' == 'abacaxi'    Log   Acabou o loop!!!

Saindo de um FOR
    :FOR     ${ITEM}      IN    @{FRUTAS}
    \    Exit For Loop If    '${ITEM}' == 'uva'
    \    Log    Minha fruta é: ${ITEM}

Usando a Keyword REPEAT
    Repeat Keyword    4    Log    Vamos logar essa frase 4 vezes!!!
