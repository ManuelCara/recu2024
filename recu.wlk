
class Ciudad {
  var property capacidad = 300
  var nivelTecnologico = 5
  var trabajadores = []
  var potenciaMinima = 20

  method potenciaMinima(numero) {
    potenciaMinima = numero
  }

  method agregarTrabjador(untrabajdor) {
    if ( trabajadores.size() > capacidad ) trabajadores.add(untrabajdor) 
  }

  method delegacionExperimentada() = trabajadores.filter({t=>t.experimentado()})
  

  method defensaInicial() {
    trabajadores.filter({t=>t.potencia() > 20}).size()

  }

  method avanzada() {
    (nivelTecnologico > 5 ) and ( trabajadores.all({t=>t.habilidad() > 12}))
  }

  method defensaReal() {
    self.delegacionExperimentada().sum({t=>t.potencia()})
  }
    method aumentarNivelTecno(numero) {
    nivelTecnologico = numero
 }
 method aumentarCapacidad() {
   capacidad = capacidad + 1
 }

 method solicitarAporte() {
   trabajadores.forEach({t=>t.aporte(self)})
 }
 method abandonar(trabajador) {
   trabajadores.remove(trabajador)
 }
 method trabajoresMasJovenes() {
   trabajadores.filter({a , b => a.edad() > b.edad()})
 }

}

class Trabajador {

    var edad = 0

    method potencia() = 20

    method habilidad() = if (edad > 20 and edad < 40 ) 15 else 10
    
    method experimentado() {
      ( edad > 25 and edad <= 35)
    }

    method aporte(ciudad) {
      ciudad.aumentarCapacidad()
      ( edad > 65) ciudad.abandonar(self)
    }

}

class Ingeniero inherits Trabajador {
  
  var conocimiento = 5
  var property estado = "no flasheado"

  override method habilidad() = super() + conocimiento * 3
  
  override method experimentado() {
    conocimiento > 8}

  method entrenar() {
    conocimiento = conocimiento + 2 
    // if ( self.experimentado()) 0 else 1 
    }
  override method aporte (ciudad) {
      ciudad.aumentarNivelTecno( conocimiento / 4) 
      estado = "Flasheo"
    }



}

class Guardia inherits Trabajador {
  
  var energia = 110

  override method potencia() = super () + (energia * 0.1)

  override method experimentado() {
    (energia > 150 ) or ( self.potencia()> 50)
  }

  method entrenar() {
    if ( ( energia + 10) > 300) energia + 10 else energia
  }
  method defender() {
    energia = energia - self.habilidad()
  }
  override method aporte(ciudad) {
    
  }
  
}

// no estoy seguro de lo que me estan pidiendo hacer en esta parte

object consorcioDeIslas  {
  var ciudades = []

  method agregarCiudad(ciudad) {
    ciudades.add(ciudad)
  }
  method capacidadActual() {
    ciudades = ciudades.size()
  }
}
