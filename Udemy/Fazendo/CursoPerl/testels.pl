#!/usr/bin/perl

#my @ls = $ssh->exec( "ls -l /" );


my @ls = qx(ls -ltr);
$tamanhodoarrayls = @ls;
print "O tamanho do array do ls e: $tamanhodoarrayls\n";
print "O retorno do ls e: @ls \n";
