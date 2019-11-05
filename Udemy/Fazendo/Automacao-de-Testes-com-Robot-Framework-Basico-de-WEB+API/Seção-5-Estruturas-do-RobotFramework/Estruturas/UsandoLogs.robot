*** Settings ***
Documentation    Suite para exemplificar o uso de Logs nos testes
...              Os logs são de grande utilidades, faça Logs para analisar como seu teste está sendo executado nas entrelinhas
...              Os logs te ajudam a achar falhas na automação dos seus testes
...              Use Logs sem moderação!!
Library          SeleniumLibrary

*** Variable ***
@{FRUTAS}        maça  banana  uva  abacaxi

*** Test Case ***
Caso de teste exemplo 01
    Usando LOG para mensagens
    Usando LOG Console
    Usando screem shots

*** Keywords ***
Usando LOG para mensagens
    Log       minha mensagem de Log
    ${VAR}    Set Variable    variável qualquer
    Log       Posso logar uma ${VAR} no meio de um log

Usando LOG Console
    Log to Console    Posso logar na saída do console
    Log Many          Posso logar minha lsta completa @{FRUTAS}
    Log               Posso logar somente itens de minha lista ${FRUTAS[0]} - ${FRUTAS[1]}

Usando screem shots
    Log       Nos testes web, podemos logar Screenshot com a SeleniumLibrary
    Open Browser     http://www.robotizandotestes.blogspot.com.br  firefox
    Capture Page Screenshot    nome_do_meuscreenshot.png
    Close Browser
