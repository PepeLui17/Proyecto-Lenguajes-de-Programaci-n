use utf8;
use Persona;

$archivo=do { 
	local $/; 
	open TEXTO, 'dataset.txt'; <TEXTO> };

@lineas=split(/\n/, $archivo);

$i = 1;
my @personas;

foreach $linea (@lineas){
	$linea =~ s/^\s+|\s+$//g; #TRIM		

	
	if(length($linea)>0){		
		$persona= Persona->new(); #Creamos un objeto del tipo persona
	}
	

	#Buscando nombres
	if($linea =~ /([M|m]i nombre es|[M|m]e llamo) ([A-Za-zÁÉÍÓÚáéíóúñ\s]+)(,|.)/){
		$persona->nombre($2);
	}
	
	#Buscando edades
	if($linea =~ /[t|T]engo ([0-9]{2}) [a|A]ños/){
		$persona->edad($1);
	}
	
	#Buscando pesos
	if($linea =~ /(peso( alrededor de| es| aproximadamente)?)( de)? ([0-9]{2,4})(((\s)?(kg|Kg))| libras)/){	
		$persona->peso($4.$5);
	}
	
	#Buscando estaturas
	if($linea =~ /([m|M]ido( aproximadamente)?|estatura es( de)?) ([0-9]{1}\.[0-9]{1,2}|[0-9]{3})( metros| m|m|cms| cms|cm| cm|,| )/){
		if($5=~ /,/){
			$persona->estatura($4);
		}
		else{
			$persona->estatura($4.$5);
		}
	}
	
	#Buscando correos
	if($linea =~ /([m|M]i( dirección( de)?)? (email|(correo( electrónico|(( de| en)? [e|E]spol))?)))( preferid[o|a])?( es)? ([_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@(([a-z]+\.)+)[a-z]{2,4})/){
		 $persona->correo($11);
	}	

	#Buscando telefonos
	if($linea =~ /([C|c]elular|[T|t]eléfono|telefónico)( es( el)?)? ([0-9]{10})/){
		$persona->telefono($4);
	}

	#Buscando estado civil
	if($linea =~ /(solter[o|a]|casad[o|a]|divorciad[o|a]|viud[o|a])/){
		 $persona->estado_civil($1);
	}

	#Buscando Universidad
	if($linea =~/(([E|e]studio( en)?)|[S|s]oy estudiante de)( la)?( universidad)? ([A-Za-zÁÉÍÓÚáéíóúñ\s]+)(,|.)/){
	#if($linea =~/(([E|e]studio( en)?)|[S|s]oy estudiante de)( la)?( universidad)? ([A-Za-zÁÉÍÓÚáéíóúñ\s]+)( en)?( la)?( universidad)? ([A-Za-zÁÉÍÓÚáéíóúñ\s]+)(,|.)/){
	 #if($linea =~/(([E|e]studio( en)?)|[S|s]oy estudiante de)( la)?( universidad)?([A-Za-zÁÉÍÓÚáéíóúñ\s]+)?( en)?( la)?( universidad)? ([A-Za-zÁÉÍÓÚáéíóúñ\s]+)(,|.)/){
		$universidad = $6;
		#$universidad = $10;
		
		#print $6."\n";
		if($universidad =~ /([I|i]ngeniería|Ing(\.)?)/){
			  #print $universidad."\n";
			  #No hacer nada
		}
		else{
			$persona->universidad($universidad);
		}
	}
	
	#Buscando Carrera
	if($linea =~/carrera( de| es)( estudio es)?(( [I|i]ng[\.]?)? ([A-Za-zÁÉÍÓÚáéíóúñ\s]+))(,|.)/){
		$persona->carrera($3);
	}
	else{
		if($linea =~/([E|e]studio|[S|s]oy estudiante de)(( [I|i]ng[\.]?)? ([A-Za-zÁÉÍÓÚáéíóúñ\s]+))(,|.)/){
			$carrera=$2;
			$comp=$1."".$2;
			if($comp =~ /([E|e]studio en la)|estudiante de la/){
				#No hacer nada
			}
			else{
				$persona->carrera($carrera);				
			}
		}
	}
	
	#Buscando Lugar de nacimiento
	#if($temporal =~/([N|n]ací en)( la( ciudad de)?)? ([A-Za-zÁÉÍÓÚáéíóúñ\s]+)(,|.| el)/){
	#if($temporal =~/([N|n]ací)? en( la( ciudad de)?)? ([A-Za-zÁÉÍÓÚáéíóúñ\s]+)(,|.)/){
	if($linea =~/([N|n]ací en)( la( ciudad de)?)? ([A-Za-zÁÉÍÓÚáéíóúñ\s]+)(,|.)/){
		#print "Lugar de nacimiento: ".$4."\n";
		$persona->lugar_nacimiento($4);
	}
	
	#Buscando domicilio
	
	#Buscando Carrera
	#if($linea =~/([a-zA-Z]+)([a-zA-Z]*) ([C|c]iencias )([a-zA-Z]+)/){
	#	#print "Carrera: ".$2.$3.$4."\n";
	#	$persona->carrera($2.$3.$4);
	#}

	#Buscando Especializacion
	if($linea =~/([S|s]istemas )([a-zA-Z]*) ([a-zA-Z]+)/){
			#print "Especialidad: ".$1.$2." ".$3."\n";
	}

	
	#Hobbies, identificacion, fecha nacimiento, especializacion, dirección
	#Buscando Fecha de Nacimiento
	#if($temporal=~/([N|n]ac[?] )([a-z]{2}*) ([a-z]*) ([a-z]*) (([0-9]{2}\/[0-9]{2}\/[0-9]{2,4})|(([0-9]{2}) (de )([a-zA-Z])( de )([0-9]{2,4})))/){
	#	print "Fecha de Nacimiento: ".$2."\n";
	#}

	push @personas, $persona;
	#print "\n";
	#$i++;
}

#Mostrando información de cada persona
foreach $person (@personas){
	print "Resumen persona # ".$i."\n";
	print "Nombre: ".$person->nombre."\n";
	#print "Edad: ".$person->edad."\n";
	#print "Peso: ".$person->peso."\n";
	#print "Estatura: ".$person->estatura."\n";
	#print "Correo: ".$person->correo."\n";
	#print "Telefono: ".$person->telefono."\n";
	#print "Estado civil: ".$person->estado_civil."\n";
	print "Universidad: ".$person->universidad."\n";
	print "Carrera: ".$person->carrera."\n";
	#print "Lugar nacimiento: ".$person->lugar_nacimiento."\n";
	
	#if($person->edad <21){
	#	print $person->nombre." tiene ".$person->edad." años, puede ir a la fiesta \n";
	#}
	
	print "\n";
	$i++;  
  }

#print "\nSuma de edades: ".$sum;


#cd C:\Users\José Luis\Documents\Perl files
#proyectoV1.pl