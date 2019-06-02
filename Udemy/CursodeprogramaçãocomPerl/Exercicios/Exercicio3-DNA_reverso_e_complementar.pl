# Faça um programa que leia um arquivo contendo uma string DNA.
# O programa deve retornar uma string que corresponda ao DNA reverso e complementar do DNA informado

# Exemplo de entrada:
# AAAACCCGGT
# Saida:
# ACCGGGTTTT

my $arquivo_dna = "dna.txt";
my @dna_reverso;

open(my $dna, "<", $arquivo_dna) or die "Não foi possivel abrir o arquivo $arquivo_dna";

foreach my $linha(<$dna>){
	foreach my $letra(split("", $linha)){
		if($letra eq "A"){
			push @dna_reverso, "T"
		}
		if($letra eq "T"){
			push @dna_reverso, "A"
		}
		if($letra eq "C"){
			push @dna_reverso, "G"
		}
		if($letra eq "G"){
			push @dna_reverso, "C"
		}
	}
}
print(join("", reverse(@dna_reverso) . "\n"));


close($dna);