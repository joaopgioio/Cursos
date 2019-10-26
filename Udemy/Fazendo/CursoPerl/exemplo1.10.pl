#!/usr/bin/perl


print "Vamos somar? Digite o primeio numero da soma: ";

chomp($numero1 = <STDIN>);
print "Agora digite o segundo numero: ";
chomp($numero2 = <STDIN>);
$soma = $numero1 + $numero2;
print "$numero1 + $numero2 = $soma\n";
