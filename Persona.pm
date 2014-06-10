package Persona;
  use strict; #Nos ponemos serios


  ######################################################################
  #Constructor de la clase
  #

  sub new {
     my $this=shift; #Cogemos la clase que somos o una referencia a la clase (si soy un objeto)
     my $class = ref($this) || $this; #Averiguo la clase a la que pertenezco

     my $self={}; #Inicializamos la tabla hash que contendrá las var. de instancia (NOMBRE Y EDAD)
     $self ->{NOMBRE} =undef ; #La clase Persona nace sin nombre  
     $self ->{EDAD}   =0 ;     #La clase Persona se construye con 0 años
	 $self ->{ESTATURA} =undef ;
	 $self ->{PESO} =undef ;
	 $self ->{CORREO} =undef ;
	 $self ->{TELEFONO} =undef ;
	 $self ->{ESTADO_CIVIL} =undef ;
	 $self ->{UNIVERSIDAD} =undef ;
	 $self ->{CARRERA} =undef ;
	 $self ->{LUGAR_NACIMIENTO} =undef ;
	 $self ->{IDENTIFICACION} =undef ;

     bless $self, $class; #Perl nos tiene que dar el visto bueno (bendecirla)
     return ($self); #Devolvemos la clase recién construida
  }
  
  ######################################################################
  #Métodos de acceso a los datos de la clase

  #metodo para ver/cambiar el nombre
  sub nombre{
       my $self=shift; #El primer parámetro de un metodo es la  clase
 
       #Miramos si se le ha pasado algún parámetro, en cuyo caso será el nombre
       $self->{NOMBRE}=shift if (@_);

       #Devolvemos el nombre
       return $self->{NOMBRE};
  }

  #metodo para ver/cambiar la edad
  sub edad{
       my $self=shift; #El primer parámetro de un metodo es la  clase
 
       #Miramos si se le ha pasado algún parámetro, en cuyo caso será la edad
       $self->{EDAD}=shift if (@_);

       #Devolvemos la edad
       return $self->{EDAD};
  }
  
  #metodo para ver/cambiar la estatura
  sub estatura{
       my $self=shift; #El primer parámetro de un metodo es la  clase
 
       #Miramos si se le ha pasado algún parámetro, en cuyo caso será la estatura
       $self->{ESTATURA}=shift if (@_);

       #Devolvemos la estatura
       return $self->{ESTATURA};
  }

  #metodo para ver/cambiar el peso
  sub peso{
       my $self=shift; #El primer parámetro de un metodo es la  clase
 
       #Miramos si se le ha pasado algún parámetro, en cuyo caso será el peso
       $self->{PESO}=shift if (@_);

       #Devolvemos el peso
       return $self->{PESO};
  }
  
  #metodo para ver/cambiar el correo
  sub correo{
       my $self=shift; #El primer parámetro de un metodo es la  clase
 
       #Miramos si se le ha pasado algún parámetro, en cuyo caso será el correo
       $self->{CORREO}=shift if (@_);

       #Devolvemos el correo
       return $self->{CORREO};
  }
  
  #metodo para ver/cambiar el telefono
  sub telefono{
       my $self=shift; #El primer parámetro de un metodo es la  clase
 
       #Miramos si se le ha pasado algún parámetro, en cuyo caso será el telefono
       $self->{TELEFONO}=shift if (@_);

       #Devolvemos el telefono
       return $self->{TELEFONO};
  }
  
  #metodo para ver/cambiar el estado civil
  sub estado_civil{
       my $self=shift; #El primer parámetro de un metodo es la  clase
 
       #Miramos si se le ha pasado algún parámetro, en cuyo caso será el estado civil
       $self->{ESTADO_CIVIL}=shift if (@_);

       #Devolvemos el estado civil
       return $self->{ESTADO_CIVIL};
  }
  
  #metodo para ver/cambiar la universidad
  sub universidad{
       my $self=shift; #El primer parámetro de un metodo es la  clase
 
       #Miramos si se le ha pasado algún parámetro, en cuyo caso será la universidad
       $self->{UNIVERSIDAD}=shift if (@_);

       #Devolvemos la universidad
       return $self->{UNIVERSIDAD};
  }
  
  #metodo para ver/cambiar la carrera
  sub carrera{
       my $self=shift; #El primer parámetro de un metodo es la  clase
 
       #Miramos si se le ha pasado algún parámetro, en cuyo caso será la carrera
       $self->{CARRERA}=shift if (@_);

       #Devolvemos la carrera
       return $self->{CARRERA};
  }
  
  #metodo para ver/cambiar el lugar de nacimiento
  sub lugar_nacimiento{
       my $self=shift; #El primer parámetro de un metodo es la  clase
 
       #Miramos si se le ha pasado algún parámetro, en cuyo caso será el lugar de nacimiento
       $self->{LUGAR_NACIMIENTO}=shift if (@_);

       #Devolvemos el lugar de nacimiento
       return $self->{LUGAR_NACIMIENTO};
  }
  
  #metodo para ver/cambiar la identificación
  sub identificacion{
       my $self=shift; #El primer parámetro de un metodo es la  clase
 
       #Miramos si se le ha pasado algún parámetro, en cuyo caso será la identificación
       $self->{IDENTIFICACION}=shift if (@_);

       #Devolvemos el lugar de nacimiento
       return $self->{IDENTIFICACION};
  }
  
  ######################################################################
  #Destructor
  #

  sub DESTROY {
        my $self=shift; #El primer parámetro de un metodo es la  clase
        delete ($self->{NOMBRE});  
        delete ($self->{EDAD}); 
		delete ($self->{ESTATURA}); 
		delete ($self->{PESO}); 
		delete ($self->{CORREO}); 
		delete ($self->{TELEFONO}); 
		delete ($self->{ESTADO_CIVIL}); 
		delete ($self->{UNIVERSIDAD}); 
		delete ($self->{CARRERA}); 
		delete ($self->{LUGAR_NACIMIENTO}); 
		delete ($self->{IDENTIFICACION}); 
  }

  #Fin
  1;
  
  
  #Codigo tomado de: http://flanagan.ugr.es/perl/objetos.htm
  #Se le realizaron las modificaciones respectivas