import paquetes.*


object DeptoDeLaMuerte {
  var property agentes = []
  var property paquetesPredefinidos = [] 

  method elMejorAgente() {
    return agentes.max({agente=>agente.cantidadPaquetesVendidos()})   
  }

  method diaDeLosMuertos(){
    self.reducirDeudaAlMejor()
    self.liberar()
    self.aumentarDeudaALosDeudores() 

  }

  method reducirDeudaAlMejor() {
    const elMejor = self.elMejorAgente()
    elMejor.reducirDeuda(50)
  }
  
  method liberar(){
    const losQuePagaron = agentes.filter({agente=>agente.pagoSuDeuda()})
    agentes.removeAll(losQuePagaron)
  }

  method aumentarDeudaALosDeudores(){
    const losDeudores = agentes.filter({agente=>!agente.pagoSuDeuda()})
    losDeudores.forEach({agente=>agente.aumentarDeuda(100)})
  }

}


class Agente{
  var property deuda
  var property cantidadPaquetesVendidos
  var property cantidadGanada = []
  var property estrategia
   
  method atender(alma) {
    const paquete = estrategia.paqueteSegun(alma)
    self.realizarVenta(paquete, alma)
  }

  method realizarVenta(alma,paquete){
    const costo = paquete.costo(alma)
    if(alma.capitalDelAlma()<costo) {
      throw new Exception(message = "No tiene suficiente saldo, no es posible venderle chau hasta luego")  
    }
    else{
      
      estrategia.paqueteSegun(alma)
      cantidadPaquetesVendidos+=1
      cantidadGanada.add(costo)


    } 
  }

  method paqueteParaOfrecer(alma) = estrategia.paqueteSegun(alma)


  method reducirDeuda(cantidad){
    deuda -= cantidad
  }

  method aumentarDeuda(cantidad){
    deuda += cantidad
  }

  method pagoSuDeuda() = self.deuda() <= 0

}


class Alma{
  var dinero
  var property accionesBuenas
  method capitalDelAlma() = dinero + accionesBuenas
}