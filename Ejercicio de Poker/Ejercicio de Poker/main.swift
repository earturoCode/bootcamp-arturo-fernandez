import Foundation

//Declaracion de estruc
struct Carta {
    let valor: String
    let palo: String

    var valorNumerico: Int {
        switch valor {
        case "A":
            return 14
        case "K":
            return 13
        case "Q":
            return 12
        case "J":
            return 11
        case "T":
            return 10
        default:
            return Int(valor) ?? 0
        }
    }

    var descripcion: String {
        return "\(valor)\(palo)"
    }
}

//Estructura para representar un jugador
struct Jugador {
    let nombre: String
    var mano: [Carta]
    var jugada: String?

    init(nombre: String) {
        self.nombre = nombre
        self.mano = []
        self.jugada = nil
    }
}

//Clase para gestionar el mazo de cartas
class Mazo {
    private var cartas: [Carta] = []

    init() {
        generarMazo()
    }

    //Genera un mazo completo de 52 cartas
    private func generarMazo() {
        let valores = [
            "A", "2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K",
        ]
        let palos = ["S", "H", "D", "C"]

        for palo in palos {
            for valor in valores {
                cartas.append(Carta(valor: valor, palo: palo))
            }
        }
    }

    //Baraja (mezcla) las cartas del mazo
    func barajar() {
        cartas.shuffle()
    }

    //Reparte una carta del mazo
    func repartirCarta() -> Carta? {
        if cartas.isEmpty {
            return nil
        }
        return cartas.removeFirst()
    }

    //Reparte una mano completa de 5 cartas
    func repartirMano() -> [Carta] {
        var mano: [Carta] = []
        for _ in 0..<5 {
            if let carta = repartirCarta() {
                mano.append(carta)
            }
        }
        return mano
    }
}

func leerCartaDesdeEntrada(_ entrada: String) -> Carta? {
    let entrada = entrada.uppercased()  //Convertir a mayúsculas : uppercased()
    guard entrada.count == 2  //Verificar longitud del texto, solo se acepta entradas de a 2 caracteres
    else {
        return nil
    }

    let valor = String(entrada.prefix(1))
    let palo = String(entrada.suffix(1))

    let valoresValidos = [
        "A", "2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K",
    ]
    let palosValidos = ["S", "H", "D", "C"]

    if valoresValidos.contains(valor) && palosValidos.contains(palo) {
        return Carta(valor: valor, palo: palo)
    } else {
        return nil
    }
}

func imprimirMano(_ mano: [Carta]) {  //Toma un arreglo de cartas y muestra sus abreviaciones en una sola línea, y va agregarndo un espacio para eso: separator: ""
    let descripcion = mano.map { $0.descripcion }.joined(separator: " ")
    print("La mano es: \(descripcion)")
}

func esSecuencia(valores: [Int]) -> Bool {
    let unicos = Array(Set(valores)).sorted()  //  Eliminar duplicados y ordenar

    if unicos == [2, 3, 4, 5, 14] {  //Escalera especial (A, 2, 3, 4, 5)
        return true
    }

    if unicos.count != 5 {  //Verificar si hay 5 valores distintos, si hay menos no puede ser escalera
        return false
    }

    for i in 0..<unicos.count - 1 {  //Verificar que estén en secuencia, sino no cumple no es escalera
        if unicos[i + 1] != unicos[i] + 1 {
            return false
        }
    }

    return true  //Si pasó todas las pruebas, es escalera
}

func detectarJugada(mano: [Carta]) -> String {
    var valores: [Int] = mano.map { $0.valorNumerico }  //Obtener los valores numéricos y ordenarlos
    valores.sort()

    let palos = mano.map { $0.palo }  //Obtener los palos de las cartas
    var conteo: [Int: Int] = [:]  //Diccionario para contar las repeticiones de cada valor.
    for valor in valores {
        conteo[valor, default: 0] += 1
    }

    let repeticiones = conteo.values.sorted(by: >)  //Arreglo de repeticiones ordenado de mayor a menor
    let esColor = Set(palos).count == 1  //Verificar si todas las cartas tienen el mismo palo, puede ser Color o Escalera de Color
    let esEscalera = esSecuencia(valores: valores)  //Verificar  si los valores forman una escalera

    if esEscalera && esColor {  //Se evalua cada jugada posible
        return "Escalera de Color"
    } else if repeticiones == [4, 1] {
        return "Póker"
    } else if repeticiones == [3, 2] {
        return "Full House"
    } else if esColor {
        return "Color"
    } else if esEscalera {
        return "Escalera"
    } else if repeticiones == [3, 1, 1] {
        return "Trío"
    } else if repeticiones == [2, 2, 1] {
        return "Doble Par"
    } else if repeticiones == [2, 1, 1, 1] {
        return "Par"
    } else {
        return "Carta Alta"
    }
}

//Función para determinar el ranking de una jugada
func rankingJugada(_ jugada: String) -> Int {
    switch jugada {
    case "Escalera de Color":
        return 8
    case "Póker":
        return 7
    case "Full House":
        return 6
    case "Color":
        return 5
    case "Escalera":
        return 4
    case "Trío":
        return 3
    case "Doble Par":
        return 2
    case "Par":
        return 1
    default:  // "Carta Alta"
        return 0
    }
}

//Función para obtener la carta más alta de una mano
func cartaMasAlta(_ mano: [Carta]) -> Int {
    let valoresOrdenados = mano.map { $0.valorNumerico }.sorted(by: >)  //Ordenar los valores numéricos de mayor a menor
    return valoresOrdenados[0]  //Retornar el valor más alto
}

//Función para comparar las manos de dos jugadores y determinar el ganador
func determinarGanador(jugador1: Jugador, jugador2: Jugador) -> String {
    guard let jugada1 = jugador1.jugada, let jugada2 = jugador2.jugada else {
        return "Error: No se han detectado las jugadas"
    }

    let ranking1 = rankingJugada(jugada1)
    let ranking2 = rankingJugada(jugada2)

    if ranking1 > ranking2 {
        return "\(jugador1.nombre) gana con \(jugada1)"
    } else if ranking2 > ranking1 {
        return "\(jugador2.nombre) gana con \(jugada2)"
    } else {

        //Si tienen la misma jugada, desempatar por carta más alta
        let cartaAlta1 = cartaMasAlta(jugador1.mano)
        let cartaAlta2 = cartaMasAlta(jugador2.mano)

        if cartaAlta1 > cartaAlta2 {
            return
                "\(jugador1.nombre) gana con \(jugada1) (carta más alta: \(valorAString(cartaAlta1)))"
        } else if cartaAlta2 > cartaAlta1 {
            return
                "\(jugador2.nombre) gana con \(jugada2) (carta más alta: \(valorAString(cartaAlta2)))"
        } else {
            return
                "Empate con \(jugada1) (misma carta alta: \(valorAString(cartaAlta1)))"
        }
    }
}

//Función auxiliar para convertir valor numérico a string
func valorAString(_ valor: Int) -> String {
    switch valor {
    case 14:
        return "A"
    case 13:
        return "K"
    case 12:
        return "Q"
    case 11:
        return "J"
    case 10:
        return "T"
    default:
        return String(valor)
    }
}

//Ejecución principal
func main() {
    //Crear jugadores
    var jugador1 = Jugador(nombre: "Jugador 1")
    var jugador2 = Jugador(nombre: "Jugador 2")

    //Crear y barajar el mazo
    let mazo = Mazo()
    mazo.barajar()  //Mezclar el mazo aleatoriamente

    //Repartir cartas a los jugadores automáticamente
    jugador1.mano = mazo.repartirMano()
    jugador2.mano = mazo.repartirMano()

    //Mostrar las manos y detectar jugadas
    print("PÓKER PARA DOS JUGADORES (CARTAS ALEATORIAS) ")

    print("\n\(jugador1.nombre):")
    imprimirMano(jugador1.mano)
    jugador1.jugada = detectarJugada(mano: jugador1.mano)
    print("Jugada detectada: \(jugador1.jugada!)")

    print("\n\(jugador2.nombre):")
    imprimirMano(jugador2.mano)
    jugador2.jugada = detectarJugada(mano: jugador2.mano)
    print("Jugada detectada: \(jugador2.jugada!)")

    //Determinar ganador con criterio de desempate por carta más alta
    print(
        "\nRESULTADO: \(determinarGanador(jugador1: jugador1, jugador2: jugador2))"
    )
}

//Iniciar el programa
main()
