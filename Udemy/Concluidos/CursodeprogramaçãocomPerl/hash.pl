					#Declaração
my %nucleotideos = (
	"A" => "adenina",
	"C" => "citosina",
	"G" => "guanina",
);

# Acessando os elementos
#print($nucleotideos{"A"});


# Tamanho do Hash
#print(scalar(%nucleotideos));

# Atribuindo um novo valor a uma chave existente
#$nucleotideos{"A"} = "Adenina";
#print($nucleotideos{"A"});

# Criando um novo elemento no Hash
$nucleotideos{"T"} = "tinina";
#print(scalar(%nucleotideos));


# Interando pelas chaves
#foreach my $chave (keys(%nucleotideos)){
#	print($chave . "\n");
#}

# Interando pelas valores
#foreach my $valor (values(%nucleotideos)){
#	print($valor . "\n");
#}

# Deletando um elemento pela Chave
delete ($nucleotideos{"A"});
foreach my $chave (keys(%nucleotideos)){
	print($chave . "\n");
}