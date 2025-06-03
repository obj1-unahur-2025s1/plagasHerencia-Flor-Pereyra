class Hogar {
  var mugre
  var confort
  method esBueno() = confort >= mugre / 2
  method efectoDelAtaque(unaPlaga) {
    mugre += unaPlaga.daño()
  }

}

// en las clases no hace falta indicar un valor, pero en los objetos si es necesario asignar un valor si o si

class Huerta {
  var produccion
  method efectoDelAtaque(unaPlaga) {
    produccion = 0.max(produccion - (unaPlaga.daño() * 0.1
    + if(unaPlaga.transmiteEnfermedades()) 10 else 0))
  } 
  method esBueno() = produccion > nivelMinimoProduccion.valor()
}

object nivelMinimoProduccion {
  var property valor =  100
}

class Mascotas {
  var salud
  method esBueno() = salud  > 250
}

class Barrio {
  const elementos = []
  method esBueno(unElemento) = unElemento.esBueno()
  method esCopado() = self.cantElementosBuenos() > self.cantElementosBuenos()
  method cantElementosBuenos() = elementos.count({e => e.esBueno()})
  method cantElementosMalos() = elementos.size()
}

class Mascota {
  var salud
  method esBueno() = salud >= 250
  method efectoDeAtaque(unaPlaga) {
    if(unaPlaga.transmiteEnfermedades()) {
      salud = (salud - unaPlaga.daño().max(0))
    }
  }
  //method efecto2(unaPlaga) {
    //salud -= (if(unaPlaga.transmiteEnfermedades()) unaPlaga //continua)
  //}
  
}

// el otro pagina

class Plaga {
    var poblacion
    method transmiteEnfermedades() = poblacion >= 10 && self.condicionAdicional()
    method condicionAdicional() = true
    method daño() = poblacion
    method efectoDeAtacar() {
        poblacion = poblacion + poblacion * 0.1
    }
}



class Cucarachas inherits Plaga {
    var pesoPromedioBicho
    override method daño() = super() * 0.5
    override method transmiteEnfermedades() = super() && pesoPromedioBicho >= 10
    override method condicionAdicional () = pesoPromedioBicho >= 10
    override method efectoDeAtacar()
    {
        super()
        pesoPromedioBicho = pesoPromedioBicho +2
    }
}
//si alguna variable me queda en amarrilo es porque nunca la use y la paso a const

class Pulgas inherits Plaga {
    override method daño() = super() * 2
    override method transmiteEnfermedades() = poblacion >= 10
}

class Garrapatas inherits Plaga {
  
}

class Mosquito inherits Plaga {
    override method condicionAdicional() = poblacion % 3 == 0
}

class Caracoles inherits clima{
    method transmiteEnfermedades() = clima.llovio()
}

object clima {
    var property llovio = true
    method transmiteEnfermedades() = llovio
}
