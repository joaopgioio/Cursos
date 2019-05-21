my @numeros;
my @frutas;
my $n;
my $f;

# Executa sempre que encontrar a condição

@numeros = (1,2,3,4,5);
@frutas = ("banana", "uva", "abacate", "Abacaxi","limao", "Melancia", "maca");

foreach $n(@numeros){
	foreach $f(@frutas){
		print("$n.$f.  \n");
	}
}