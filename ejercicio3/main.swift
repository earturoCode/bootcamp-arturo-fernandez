import Foundation

func nextBig(numero: Int) -> Int? {
    
    // Se convierte el número a array de dígitos
    var numeroingresado = String(numero).compactMap { Int(String($0)) }     // .compactMap = Aplica una transformación a cada carácter y elimina los nil
    
    // Si el número tiene un solo dígito, no hay otro número posible y tira nil
    if numeroingresado.count <= 1 {
        return nil
    }
    
    // Para obtener el mayor número posible, simplemente ordenamos los dígitos de mayor a menor
    numeroingresado.sort(by: >) // .sort(by: aca < o >) = ordena los elementos del array según el criterio proporcionado
    
    // Convertir el array de dígitos de vuelta a un número
    let resultado = numeroingresado.reduce(0) { $0 * 10 + $1 } //reduce(0) = combina todos los elementos de un array en un solo valor, valor incial
    
    // Si el resultado es igual al número original, no hay un número mayor y devuelve nil
    if resultado == numero {
        return nil
    }
    
    return resultado
}

    //Mensaje para que el usuario ingrese el numero
    print("Ingrese un número entero positivo:")
    //Entrada de datos
    if let input = readLine(), let numero = Int(input) {
        print("El número actual es: \(numero)")
        
        //Validacion de dato ingresado
        if let mayorposibleNumero = nextBig(numero: numero) {
            print("El número mayor posible es: \(mayorposibleNumero)")
        } else {
            print("No existe un número mayor con los mismos dígitos.")
        }
    } else {
        print("Por favor, ingrese un número válido.")
        
    }

