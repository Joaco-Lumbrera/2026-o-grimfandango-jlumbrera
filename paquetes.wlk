import programa.*



class Paquete{
    var precio
    method aniosQueReduce(alma)

    method costo(alma) = (precio*self.aniosQueReduce(alma)).min(350)
    

}

class PaqueteTren inherits Paquete{
    override method aniosQueReduce(alma) = 4
}

class PaqueteBote inherits Paquete{
    override method aniosQueReduce(alma) = (alma.accionesBuenas()/50).min(2)
  
}

class PaqueteCrucero inherits PaqueteBote{
    override method aniosQueReduce(alma) = super(alma) * 2
}


class PaquetePalo inherits Paquete{
    override method aniosQueReduce(alma) = 0.05

    override method costo(alma) = (precio*self.aniosQueReduce(alma))
}