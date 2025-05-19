import Foundation
//CLASE DE RELOJ
class reloj {
    private var horas:Int       //0-23
    private var minutos:Int     //0-59
    private var segundos:Int      //0-59
    
    
    init () {
        self.horas = 12
        self.minutos = 0
        self.segundos = 0
    }
    
    init (horas:Int , minutos:Int , segundos:Int ){
        self.horas = horas % 24
        self.minutos = minutos % 60
        self.segundos = segundos % 60
    }
    
    init (SegundosMediaNoche:Int) {
        let tiempo = SegundosMediaNoche * 86400 //1 hora = 3600 , 24 * 60 = 1440 minutos * 60 = 86400
        
        let horascalcu = tiempo / 3600
        let minutoscalcu = (tiempo % 3600) / 60
        let segundoscalcu = tiempo % 60
        
        
        self.horas = horascalcu
        self.minutos = minutoscalcu
        self.segundos = segundoscalcu
    }
    
    func setReloj(SegundodMediaNoche:Int) {
        let tiempo = SegundodMediaNoche * 86400 //1 hora = 3600 , 24 * 60 = 1440 minutos * 60 = 86400
        
        let horascalcu = tiempo / 3600
        let minutoscalcu = (tiempo % 3600) / 60
        let segundoscalcu = tiempo % 60
        
        
        self.horas = horascalcu
        self.minutos = minutoscalcu
        self.segundos = segundoscalcu
        
    }
    
    func getHoras() -> Int{
        return horas
        
    }
    func getMinutos() -> Int{
        return minutos
        
    }
    func getSegundos() -> Int{
        return segundos
        
    }
    
    func setHoras(_ h:Int){
        self.horas = h
        
    }
    func setMinutos(_ m:Int){
        self.minutos = m
        
    }
    func setSegundos(_ s:Int){
        self.segundos = s
        
    }
    
    func tick ( ){
        segundos += 1
        if segundos == 60 {
            segundos = 0
            minutos += 1
        }
        if minutos == 60 {
            minutos = 0
            horas += 1
        }
        if horas == 24 {
            horas = 0
        }
    }
    
    func tickDecrement ( ){
        segundos -= 1
        if segundos < 0 {
            segundos = 59
            minutos -= 1
        }
        if minutos < 0 {
            minutos = 59
            horas -= 1
        }
        if horas < 0 {
            horas = 23
        }
    }
    
    func addReloj(otroReloj : reloj){
        
    }
    
    func toString(){
        
    }
    
    func restaReloj(){
        
    }
    
    
    
    
    
    class RelojDemo {
        static func main(){
            print("Ingrese el timpo en segundos desde la medianoche:")
            if let ingreso = readLine(), let segundosingresados = Int(ingreso){
                let reloj1 = reloj(SegundosMediaNoche: segundosingresados)
                print("Reloj inicial: \(reloj1.toString())")
                
                
                print("Ticking ejecutandose 10 veces: ")
                for _ in 1...10{
                    reloj1.tick()
                    print(reloj1.toString())
                }
                
                
                
                
            }
        }
        
    }
}

RelojDemo.main()


