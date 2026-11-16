import programa.*
import paquetes.*
class Estrategia{

    method paqueteSegun(alma)
}
object clasica inherits Estrategia{

    override method paqueteSegun(alma){
        const alcanzables = DeptoDeLaMuerte.paquetesPredefinidos().filter({ paquete => paquete.costoPara(alma) <= alma.capitalDelAlma() })
        return alcanzables.max({ paquete => paquete.costoPara(alma) })
    }

}


object navegante inherits Estrategia{
    override method paqueteSegun(alma){
        if(alma.accionesBuenas()>=50) new PaqueteCrucero(precio=alma.accionesBuenas())
        else new PaqueteBote(precio=alma.accionesBuenas())
    }

}


object indiferente inherits Estrategia{
   override method paqueteSegun(alma) = new PaquetePalo(precio = 1.randomUpTo(300))
}