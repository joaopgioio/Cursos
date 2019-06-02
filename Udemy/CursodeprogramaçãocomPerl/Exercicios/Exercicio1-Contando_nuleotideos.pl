# Faça um programa que leia um arquivo contendo uma string DNA.
# O programa deve retornar 4 inteiros separados por espacos sendo eles a quantidade de ocorrencias de
# 'A', 'C', 'G', and 'T' respectivamente

# Exemplo de entrada:
# AGCTATGCAGTCGTCAGTACCTACGTAAGCTGCTGACATGCATGCGTATGATGATTGATAGG
# Saida:
# 20 12 17 21


my $nome_arquivo = "dna.txt";
my $dna;
my $count_A = 0;
my $count_C = 0;
my $count_G = 0;
my $count_T = 0;

open($dna, "<", $nome_arquivo)
	or die "Não foi possivel ler o arquivo $nome_arquivo";

foreach my $linha(<$dna>){
	foreach my $letra(split("", $linha)){
		if($letra eq "A"){
			$count_A++;
		}
		if($letra eq "C"){
			$count_C++;
		}
		if($letra eq "G"){
			$count_G++;
		}
		if($letra eq "T"){
			$count_T++;
		}
	}
}
close($dna);
print($count_A ." ". $count_C ." ". $count_G ." ". $count_T."\n");