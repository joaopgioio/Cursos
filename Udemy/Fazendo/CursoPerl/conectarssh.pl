#!/usr/bin/perl
  
use warnings;
use strict;
use Net::SSH::Expect;
use Data::Dumper;


our $SSH = 1;# Valor 1 -> Realiza comandos via ssh; Valor 0 -> Realiza comandos via Telnet

## Parametro de entrada
my ($ip, $user, $password) = @ARGV;;
if(!$ip || !$user || !$password){
	print "SIGRES_FATAL = Numero/orden de parametros incorrecto-usar <ipaddress> <user> <password>\n";
	exit;
}


my $ssh = Net::SSH::Expect->new (
	      host => "$ip",
	      password => "$password",
	      user => "$user",
          raw_pty => 1
);

my $login_output = $ssh->login();
if ( $login_output !~ /The program/ )
{
        die "Problema ao tentar logar => $login_output";
}

# Executa SSH
$ssh->exec( "stty raw -echo" );

# Ler retorno
my @ls = $ssh->exec( "ls -l /" );

# Dividi retorno
#my $scal;
#my @v;


# $scal = $_ foreach @ls;
# my $lss = join( '\n' , $scal ) ;
# my @v = split( /\n/, $lss );

# print "LINHAV $scal \n";

	my $lss = join( '\n' , @ls ) ;
	my @ls1 = split (/\n/, $lss);
	my $v;
		foreach my $v (@ls1) {
			if ($v =~ '^(.*?)-+686.*') {
				print "\n";
				print "LINHAV $v \n";
			}else{
				if ($v =~ '^(.*?)\s+var.*') {
						print "\n";
						print "LINHAV $v \n";
				}
			}
		}
		
		
#my $lss = join( '\n' , @ls ) ;
#my @v = split( /\n/, $lss );


#Ler retorno dividido
#print $v[ 0 ];
#print $scal;

# print "\n";
# print $v[ 3 ];
# print "\n";
# print $v[ 4 ];
# print "\n";