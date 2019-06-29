my @nomes = ("Lorena","Maria","Vania","Tania");
my $contador = 0;
my $tamanho = scalar(@nomes);
	

while ($contador < $tamanho){
	print($nomes[$contador]."\n");
	$contador++;
}


#"Escreva um algoritmo em Perl que receba 4 nomes em um array e escreva-os na tela um a um.