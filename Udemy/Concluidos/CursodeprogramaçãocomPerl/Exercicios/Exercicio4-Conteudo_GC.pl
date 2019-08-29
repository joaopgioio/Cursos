# O conteudo GC de uma string de DNa pe dado pela porcentagem de simbolos na string que sao 'C' ou 'G'
# Por exemplo, o conteudo de GC de "AGCTATAG" é de 37,5%
# Considerando isso , faca um programa que leia um arquivo FASTA(que começam com o caracter ">")
# O programa deve retornar o do conteudo GC.

# Exemplo de entrada:
# >MinhaSequencia
# CCACCCTCGTGGTATGGCTAGGATTCAGGAACCGGAGAACGCTTCAGACCAGCCCGGACTGGGAACCTGCGGGGCATCGGAAT
# Saida:
# 60.919540

my $arquivo_fasta = "dna.fasta";
my $tamanho = 0;
my $GC = 0;

open(my $fasta, "<", $arquivo_fasta) or die "Nao foi possivel abrir o arquivo $arquivo_fasta";
foreach my $linha(<$fasta>){
	my @letras = split("", $linha);
	if($letras[0] ne ">"){
		foreach my $letra(@letras){
			$tamanho++;
			if($letra eq "C" or $letra eq "G"){
				$GC++;
			}
		}
	}
}
close($fasta);

print( $GC * 100 / $tamanho);
