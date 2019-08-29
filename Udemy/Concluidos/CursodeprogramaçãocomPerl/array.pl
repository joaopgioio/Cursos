					#Declaração
my @cores = ("Azul", "Amarelo","Vermelho", "Laranja");

#foreach my $cor(@cores){
#	print($cor."\n");
#}
#print($cores[0] ."\n");
#print($cores[1] ."\n");
# print($cores[2] ."\n");

					# Acessando um elemento do Array

#print($cores[0] ."\n");
#print($cores[1] ."\n");
#print($cores[2] ."\n");
	
					# Tamanho do Array

	#$tamanho = scalar(@cores); # opcao tamanho
	#print($tamanho . "\n");    # opcao tamanho
	#print(scalar(@cores)."\n");

					# Ordenando

@cores = sort(@cores);

					# Invertendo

@cores = reverse(@cores);

					# Inserindo elementos no final
push  (@cores,  "Preto", "Branco", "Marrom");

					# Removendo o ultimo elemento
my $ultimo = pop(@cores);

					# Removendo o primeiro elemento
my $primeiro = shift(@cores);

					# Percorrendo o array

foreach my $cor(@cores){
	print($cor."\n");
}

#for ($i = 0; $i <= $#cores; $i++){
#	print($cores[$i]."\n");
#}




