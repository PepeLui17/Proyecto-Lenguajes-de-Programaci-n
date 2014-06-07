use utf8;
#use open 'locale'; 
#use encoding;
#use utf8;

#use open ':locale'; 
 
#use open OUT => ':utf8';    # la salida será en utf8
#use open ':std';            # y en los controladores estándares: STDIN, STDOUT, STDERR

$archivo=do { 
	local $/; 
	open TEXTO, 'dataset.txt'; <TEXTO> };

@lineas=split(/\n/, $archivo);

$i = 1;

foreach $linea (@lineas){
	$linea =~ s/^\s+|\s+$//g; #TRIM
	
	$temporal=$linea;
	
	if(length($temporal)>0){
		print "Resumen persona # $i \n";
	}

	#Buscando nombres
	if($temporal =~ /(nombre es|llamo) ([A-Za-zÁÉÍÓÚáéíóúñ\s]+)(,|.)/){		
		print "Nombre: ".$2."\n";
	}
	
	#Buscando edades
	if($temporal =~ /(t|T)engo ([0-9]{2}) años/){
		print "Edad: ".$2."\n";
	}
	
	#Buscando pesos
	#if($temporal =~ /(peso|peso alrededor de|peso es) ([0-9]{2,4})( kg| Kg|kg|Kg| libras)/){
	if($temporal =~ /(peso|peso alrededor de|peso es) ([0-9]{2,4})(((\s)?(kg|Kg))| libras)/){	
		print "Peso: ".$2.$3."\n";
	}
	
	#Buscando estaturas
	if($temporal =~ /([m|M]ido|estatura es|estatura es de|[M|m]ido aproximadamente) ([0-9]{1}\.[0-9]{1,2}|[0-9]{3})( metros| m|m|cms| cms|cm| cm|,| )/){
		print "Estatura: ".$2.$3."\n";
	}
	
	#Buscando correos
	if($temporal =~ /([m|M]i correo es|[m|M]i correo electrónico es|[M|m]i correo) ([_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@(([a-z]+\.)+)[a-z]{2,4})/){
		print "Correo: ".$2."\n";
	}	

	#telefono,estado civil, lugar de nacimiento, Universidad, carrera.
	#Buscando telefonos
	if($temporal =~ /([C|c]elular|[T|t]eléfono|telefónico)( es( el)?)? ([0-9]{10})/){
		print "Teléfono: ".$4."\n";
	}

	#Buscando Estado Civil
	if($temporal =~ /(solter[o|a]|casad[o|a]|divorciad[o|a]|viud[o|a])/){
		print "Estado Civil: ".$1."\n";
	}

	#Buscando Universidad
	#if($temporal =~/([E|e]spol)/){
	if($temporal =~/([E|e]studio en|[S|s]oy estudiante de)( la)? ([A-Za-zÁÉÍÓÚáéíóúñ\s]+)(,|.)/){
		$universidad = $3;
		if($universidad =~ /([I|i]ngeniería)/){
			  #print "";
		}
		else{
			print "Universidad: ".$universidad."\n";
		}
	}

	#Buscando Lugar de nacimiento
	#if($temporal =~/([N|n]ací en)( la( ciudad de)?)? ([A-Za-zÁÉÍÓÚáéíóúñ\s]+)(,|.| el)/){
	#if($temporal =~/([N|n]ací)? en( la( ciudad de)?)? ([A-Za-zÁÉÍÓÚáéíóúñ\s]+)(,|.)/){
	if($temporal =~/([N|n]ací en)( la( ciudad de)?)? ([A-Za-zÁÉÍÓÚáéíóúñ\s]+)(,|.)/){
		print "Lugar de nacimiento: ".$4."\n";
	}
	
	#Buscando domicilio
	
	#Buscando Carrera
	if($temporal =~/([a-zA-Z]+)([a-zA-Z]*) ([C|c]iencias )([a-zA-Z]+)/){
		print "Carrera: ".$2.$3.$4."\n";
	}

	#Buscando Especializacion
	if($temporal =~/([S|s]istemas )([a-zA-Z]*) ([a-zA-Z]+)/){
			print "Especialidad: ".$1.$2." ".$3."\n";
	}

	#Buscando Fecha de Nacimiento
	#if($temporal=~/([N|n]ac[?] )([a-z]{2}*) ([a-z]*) ([a-z]*) (([0-9]{2}\/[0-9]{2}\/[0-9]{2,4})|(([0-9]{2}) (de )([a-zA-Z])( de )([0-9]{2,4})))/){
	#	print "Fecha de Nacimiento: ".$2."\n";
	#}

	print "\n";
	$i++;
}


#cd C:\Users\José Luis\Documents\Perl files
#proyectoV1.pl

#AAAAAAAAAAAAAAAAAAAAAAAAAAAAA