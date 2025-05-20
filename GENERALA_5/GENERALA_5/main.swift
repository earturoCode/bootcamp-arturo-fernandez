import Foundation

func identificarJugadasGenerala (dados:String ) -> String {

    //validacion del rango de numeros que estan permitido
    guard dados.count == 5, dados.allSatisfy({ $0.isNumber } ) //allSatify = verificar si todos los elementos cumplen
                                                            //.isNumber = verifica cada caracter si es un numero de 0 a 9
    else {
        return "Entrada invalida, vuelve a intentarlo!"
    }
    
    let numeros = dados.compactMap {Int(String($0))}
    
    //validacion de enteros solamente
    guard numeros.allSatisfy ( {(1...6).contains($0) } )
    else{
        return "Los valores deben de ser del numero 1 al 6 solamente!"
        
    }
    
    //Diccionario
    var conteo:[Int:Int] = [:]
    
    for dados in numeros {
        conteo [dados, default:0 ] += 1
    }
    
    //Detectar cual es la jugada
    if conteo.values.contains(5) {
        return "GENERALA"
    }
    
    if conteo.values.contains(4) {
        return "POKER"
    }
    
    if conteo.values.contains(3) && conteo.values.contains(2) {
        return "FULL"
    }
    
    let dadosOrdenados = numeros.sorted()
   
    switch true {
    case dadosOrdenados == [1,2,3,4,5]:
        return "ESCALERA"
    case dadosOrdenados == [2,3,4,5,6]:
        return "ESCALERA"
    case Set(numeros) == Set([3,4,5,6,1]):
            return "ESCALERA"
    default:
        return "NADA"
    }
}

var resultado = ""

repeat{
    print("Ingrese 5 digitos entre 1 y 6 : ")
    if let numero = readLine()  {
        resultado = identificarJugadasGenerala (dados: numero)
        if resultado == "Entrada invalida, vuelve a intentarlo!" || resultado == "Los valores deben de ser del numero 1 al 6 solamente!"{
            print ("Intenta de nuevo, datos invalidos!")
        }
    }
} while resultado == "Entrada invalida, vuelve a intentarlo!" || resultado == "Los valores deben de ser del numero 1 al 6 solamente!"
print ("Resultado: \(resultado)")
