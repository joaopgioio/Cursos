our $media = 5.0;

@alunos = ('Joao','JoaoP','Lorena','Silmara','Andre','Pedro','Jose','Joaquim','Teixeira','Manel','ZEZE');
@notas = (5.1,10.0,9.6,1.2,3.8,6.8,7.4,8.32,5.0,4.93,0.56);


for(my $i = 0; $i <= $#notas; $i++){
	our $mensagemAprovado = "Você foi aprovado";
	our $mensagemReprovado = "Você foi reprovado";	
	if($notas[$i] >= $media){
		if($notas[$i] => 7.5){
			$mensagemAprovado = "Parabens, você foi aprovado com louvor";
		}
		print("######################################################################################\n");
		print("#    ".$alunos[$i]." sua nota é ".$notas[$i]." ".$mensagemAprovado."         #\n");
		print("######################################################################################\n\n");
	}else{
		if($notas[$i] <= 2.5){		
			$mensagemReprovado = "Você foi reprovado,sua nota foi muito baixa. Estude mais";
		}
		print("######################################################################################\n");
		print("#    ".$alunos[$i]." sua nota é ".$notas[$i]." ".$mensagemReprovado."      #\n");
		print("######################################################################################\n\n");
	}
}