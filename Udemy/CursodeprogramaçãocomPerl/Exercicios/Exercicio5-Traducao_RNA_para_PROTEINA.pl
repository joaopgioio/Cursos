# Os 20 aminoácidos que compõe as proteínas podem ser abreviados 20 letras do alfabeto inglês 
# (todas as letras, exceto B, J, O, U, X e Z). As cadeias de proteínas são construídas a partir desses 20 símbolos. 
# A tabela de codificação de RNA determina os detalhes relativos à codificação de 
# codões específicos no alfabeto de aminoácidos. 
# Sendo assim, faça um programa que leia um arquivo FASTA contendo uma string de RNA (mRNA). 
# O programa deve retornar uma string que corresponda a sequência proteica codificada do mRNA informado.

# Exemplo entrada:
# >meuRNA
# AUGGCCAUGGCGCCCAGAACUGAGAUCAAUAGUACCCGUAUUAACGGGUGA
# Saída:
# MAMAPRTEINSTRING

my $arquivo_rna = "rna.fasta";
#my $tamanho = 0;
my $codon = "";

open(my $rna, "<", $arquivo_rna) or die "Nao foi possivel abrir o arquivo $arquivo_rna";

my %codons = (
	'UCA' => 'S', 'UCC' => 'S', 'UCG' => 'S', 'UCU' => 'S', 'AGC' => 'S', 'AGU' => 'S', # Serina
	'UUC' => 'F', 'UUU' => 'F', # Fenilalanina
	'UAC' => 'Y', 'UAU' => 'Y', # Tirosina
	'UAA' => 'stop', 'UAG' => 'stop', 'UGA' => 'stop', # Stop
	'UGC' => 'C', 'UGU' => 'C', # Cisteina
	'UGG' => 'W', # Triptofano
	'CUA' => 'L', 'CUC' => 'L', 'CUG' => 'L', 'CUU' => 'L', 'UUA' => 'L', 'UUG' => 'L', # Leucina
	'CCA' => 'P', 'CCC' => 'P', 'CCG' => 'P', 'CCU' => 'P', # Prolina
	'CAU' => 'H', 'CAC' => 'H', # Histidina
	'CAA' => 'Q', 'CAG' => 'Q', # Glutamina
	'CGA' => 'R', 'CGC' => 'R', 'CGG' => 'R', 'CGU' => 'R', # Arginina
	'AUA' => 'I', 'AUC' => 'I', 'AUU' => 'I', # Isoleucina
	'AUG' => 'M', # Metionina
	'ACA' => 'T', 'ACC' => 'T', 'ACG' => 'T', 'ACU' => 'T', # Treonina
	'AAC' => 'N', 'AAU' => 'N', # Asparagina
	'AAA' => 'K', 'AAG' => 'K', # Lysina
	'AGA' => 'R', 'AGG' => 'R', # Arginina
	'GUA' => 'V', 'GUC' => 'V', 'GUG' => 'V', 'GUU' => 'V', # Valina
	'GCA' => 'A', 'GCC' => 'A', 'GCG' => 'A', 'GCU' => 'A', # Alanina
	'GAC' => 'D', 'GAU' => 'D', # Aspartato
	'GAA' => 'E', 'GAG' => 'E', # Glutamato
	'GGA' => 'G', 'GGC' => 'G', 'GGG' => 'G', 'GGU' => 'G'  # Glicina
);

foreach my $linha(<$rna>){

	if(substr($linha,0, 1) ne ">"){
		for (my $i = 0; $i < length($linha);$i = $i + 3){

			$codon = substr($linha,$i, 3);
				if($codons{$codon} ne 'stop'){
				print($codons{$codon});
				}else{
					last;
				}
		}
		if($codons{$codon} ne 'stop'){
			print(' Aviso: Tradução não terminou com um stop codon!');
		}
	}
}

close($rna);