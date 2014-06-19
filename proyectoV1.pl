
use utf8;
use Persona;

$archivo=do { 
	local $/; 
	open TEXTO, 'dataset.txt'; <TEXTO> };

@lineas=split(/\n/, $archivo);

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
		$universidad = $6;
		if($universidad =~ /[I|i]ng[\n]?/){
			#No hacer nada
		}
		elsif($universidad =~ /en( la)?/){
			@texto=split(/en la/, $6);
			$txt=$texto[1];
			$persona->universidad($txt);
			  #No hacer nada
		}
		else{
			$persona->universidad($universidad);
		}
	}
	
	#Buscando Carrera
	if($linea =~/carrera( de| es)( estudio es)?(( [I|i]ng[\.]?)? ([A-Za-zÁÉÍÓÚáéíóúñ\s]+))(,|.)/){
		@texto=split(/en la/, $3);
		$txt=$texto[0];
		
		if($txt =~ /[E|e]specialización|[O|o]rientación/){
			@x=split(/[E|e]specialización|[O|o]rientación/, $txt);
			$carrera=$x[0];
			$persona->carrera($carrera);
		}
		else{
			$persona->carrera($txt);	
		}
	}
	else{
		if($linea =~/([E|e]studio|[S|s]oy estudiante de)(( [I|i]ng[\.]?)? ([A-Za-zÁÉÍÓÚáéíóúñ\s]+))(,|.)/){
			$comp=$1."".$2;
			if($comp =~ /([E|e]studio en la)|estudiante de la/){
				#No hacer nada
			}
			else{
				@texto=split(/en la/, $2);
				$txt=$texto[0];
				if($txt =~ /[E|e]specialización|[O|o]rientación/){
					@x=split(/[E|e]specialización|[O|o]rientación/, $txt);
					$carrera=$x[0];
					$persona->carrera($carrera);
				}
				else{
					$persona->carrera($txt);	
				}				
			}
		}
	}
	
	#Buscando Lugar de nacimiento
	if($linea =~/([N|n]ací( en| el)?)( la( ciudad de)?)? ([\/\\0-9A-Za-zÁÉÍÓÚáéíóúñ\s]+)(,|.)/){
		$comp=$5;
		if($comp =~/en la ciudad de/){
			@texto=split(/en la ciudad de/, $comp);
			$lugarNac=$texto[1];
			$persona->lugar_nacimiento($lugarNac);
		}
		elsif($comp =~/el/){
			@texto=split(/el/, $comp);
			$lugarNac=$texto[0];
			$persona->lugar_nacimiento($lugarNac);
		}
		elsif($comp =~/[0-9]/){
			#No hacer nada
		}
		else{
			$persona->lugar_nacimiento($5);
		}
	}
	#Buscando Identificacion
	if($linea =~/((matr[í|i]cula |c[é|e]dula )(es )?)(([0-9]+){9,10})/){
		$persona->identificacion($4);
	}
		
	push @personas, $persona;
	
}

$i = 1;

#Mostrando información de cada persona
foreach $person (@personas){
	print "Resumen persona # ".$i."\n";
	print "Nombre: ".$person->nombre."\n";
	print "Edad: ".$person->edad."\n";
	print "Peso: ".$person->peso."\n";
	print "Estatura: ".$person->estatura."\n";
	print "Correo: ".$person->correo."\n";
	print "Telefono: ".$person->telefono."\n";
	print "Estado civil: ".$person->estado_civil."\n";
	print "Universidad: ".$person->universidad."\n";
	print "Carrera: ".$person->carrera."\n";
	print "Lugar nacimiento: ".$person->lugar_nacimiento."\n";
	print "Identificacion(Cedula o matricula): ".$person->identificacion."\n";
	
	print "\n";
	$i++;  
  }
  
#cd C:\Users\José Luis\Documents\Perl files
#proyectoV1.pl