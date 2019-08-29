# Faça um programa que leia um arquivo contendo uma string DNA.
# O programa deve retornar um arquivo contendo o RNA transcrito do DNA informando, substituindo os "T"s por "U"

# Exemplo de entrada:
# AGCTATGCAGTCGTCAGTACCTACGTAAGC
# Saida:
# AGCUAUGCAGUCGUCAGUACCUACGUAAGC

my $arquivo_dna = "dna.txt";
my $arquivo_rna = "rna.txt";
my $dna;
my $rna;


open($dna, "<", $arquivo_dna) or die "Não foi possivel abrir o arquivo $nome_arquivo";
open($rna, ">", $arquivo_rna) or die "Não foi possivel abrir o arquivo $nome_arquivo";

foreach my $linha(<$dna>){
	#print($linha . "\n");
	foreach my $letra(split("", $linha)){
		#print($letra . "\n");
		if ($letra eq "T"){
			print $rna "U";
		}else{
			print $rna $letra;
		}
	}
}
close($rna);
close($dna);
#print($letra_T);