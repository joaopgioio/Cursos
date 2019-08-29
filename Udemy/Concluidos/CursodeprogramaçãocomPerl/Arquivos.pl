my $nome_arquivo = "dna.txt";
my $dna;
my @nucleotideos = ("A", "C", "G", "T");

# Criando arquivo para escrita
open($dna, ">", $nome_arquivo)
	or die "Não foi possível abrir o arquivo $nome_arquivo";

for (my $i = 0; $i <= $#nucleotideos; $i++){
	print $dna $nucleotideos[$i];
}
print $dna "\n";
close($dna);

# Abrindo o arquivo para escrita
open($dna, ">>", $nome_arquivo)
	or die "Não foi possível abrir o arquivo $nome_arquivo";

for (my $i = 0; $i <= $#nucleotideos; $i++){
	print $dna $nucleotideos[$i];
}
print $dna "\n";
close($dna);

# Abrindo o arquivo para leitura
open($dna, "<", $nome_arquivo)
	or die "Não foi possível abrir o arquivo $nome_arquivo";
foreach my $linha(<$dna>){
	print ($linha . "\n");
}
close($dna);