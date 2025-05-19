import Foundation

class Reloj {
    private var horas:Int       //0-23
    private var minutos:Int     //0-59
    private var segundos:Int    //0-59
    
    //Constructores
    init() {
        self.horas = 12
        self.minutos = 0
        self.segundos = 0
    }
    

    init(horas:Int, minutos:Int, segundos:Int) {
        self.horas = horas % 24
        self.minutos = minutos % 60
        self.segundos = segundos % 60
    }
    

    init(SegundosMediaNoche:Int) {

        let tiempo = SegundosMediaNoche % 86400 // 86400 = 24 horas * 60 minutos * 60 segundos
        
        let horascalcu = tiempo / 3600
        let minutoscalcu = (tiempo % 3600) / 60
        let segundoscalcu = tiempo % 60
        
        self.horas = horascalcu
        self.minutos = minutoscalcu
        self.segundos = segundoscalcu
    }
    
    // Metodos
    func setReloj(SegundosMediaNoche:Int) {

        let tiempo = SegundosMediaNoche % 86400
        
        let horascalcu = tiempo / 3600
        let minutoscalcu = (tiempo % 3600) / 60
        let segundoscalcu = tiempo % 60
        
        self.horas = horascalcu
        self.minutos = minutoscalcu
        self.segundos = segundoscalcu
    }
    
    func getHoras() -> Int {
        return horas
    }
    
    func getMinutos() -> Int {
        return minutos
    }
    
    func getSegundos() -> Int {
        return segundos
    }
    
    func setHoras(_ h:Int) {
        self.horas = h % 24
    }
    
    func setMinutos(_ m:Int) {
        self.minutos = m % 60
    }
    
    func setSegundos(_ s:Int) {
        self.segundos = s % 60
    }
    
    //Incremento
    func tick() {
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
    
    //Decremento
    func tickDecrement() {
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
    
    //Para pasar todo a segundos
    private func convertirSegundos() -> Int {
        return horas * 3600 + minutos * 60 + segundos
    }
    
    
    func addReloj(otroReloj: Reloj) {
        let totalSegundos = self.convertirSegundos() + otroReloj.convertirSegundos()
        setReloj(SegundosMediaNoche: totalSegundos)
    }
    
    //Formato de como se va imprimir despues
    func toString() -> String {
        let horasStr = String(format: "%02d", horas)
        let minutosStr = String(format: "%02d", minutos)
        let segundosStr = String(format: "%02d", segundos)
        return "[\(horasStr):\(minutosStr):\(segundosStr)]"
    }
    

    func restaReloj(_ otroReloj: Reloj) -> Reloj {
        let totalSegundos = self.convertirSegundos() - otroReloj.convertirSegundos()
        
        
        //para validad y que no sea negativo
        let segundovalidado = (totalSegundos % 86400 + 86400) % 86400
        return Reloj(SegundosMediaNoche: segundovalidado)
    }
}
    
    
//Clase nueva de RelojDemo :D
class RelojDemo {
    static func main() {
        print("Bienvenido al RelojDemo")
        
        // Validar munero ingresado
        var segundosIngresados: Int = -1
        
        repeat {
            print("Ingrese el tiempo en segundos desde la medianoche (debe ser positivo):")
            if let ingreso = readLine(), let segundos = Int(ingreso) {
                if segundos >= 0 {
                    segundosIngresados = segundos
                } else {
                    print("Error: El número debe ser positivo. Inténtelo de nuevo.")
                }
            } else {
                print("Error: Entrada inválida. Debe ingresar un número entero.")
            }
        } while segundosIngresados < 0
        
        let reloj1 = Reloj(SegundosMediaNoche: segundosIngresados)
        print("Reloj inicial: \(reloj1.toString())")
        
        print("\nTicking ejecutándose 10 veces:")
        for i in 1...10 {
            reloj1.tick()
            print("Tick \(i): \(reloj1.toString())")
        }
        
        let reloj2 = Reloj(horas: 10, minutos: 37, segundos: 19)
        print("\n Nuevo reloj: \(reloj2.toString())")
        
        let relojResultado = reloj1.restaReloj(reloj2)
        print("Resultado de la resta (\(reloj1.toString()) - \(reloj2.toString())): \(relojResultado.toString())")
    }
}


RelojDemo.main()
