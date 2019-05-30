#strings

$frase = "Ola mundo, imprimindo variaveis";

print("$frase \n");

$tamanho = length($frase);
print("$tamanho \n");


#substr  -    Corta strings e pedacos - Para aparecer os valores iniciais, precisamos passar a posição,
# porem a posição do promeiro caracter é 0 e precisamos passar o tamano que desejamoscortar, por exemplo:
# para que eu pegue "Ola mundo," precisamos passar a posicao inicial: 0 e o tamanho de corte: 10
# se nao passarmos a posicao inicial, ele apresenta os valores a partir do numero de corte

$pedaco = substr($frase, 0, 10);
print($pedaco);


