import Foundation
func clase2() {
    //Cargar un array de manera aleatoria con 10 números enteros del -5 al 5. Imprimirlo en  pantalla y
    //computar cuál es el mayor elemento del vector.
    
    var aleatorio:[Int] = []
    for _ in 1...10 {
        let numero = Int.random(in: -5...5)
        aleatorio.append(numero)
        
    }
    print ("El vector generado es: \(aleatorio)")
    
    if let maximo = aleatorio.max() {
        print("El mayor elemento del vector es: \(maximo)")
    }
    
    
    //Cargar  un  array  de  manera  aleatoria  con  100  números enteros del -30 al 30. Imprimirlo en
    //pantalla y computar cuál es el elemento que más veces se repite, y cuáles son los números  que
    //no están presentes (si es que hay alguno)
    
    var numeroaleatorio:[Int] = [ ]
    for _ in 1...100 {
        let numero2 = Int.random(in: -30...30)
        numeroaleatorio.append(numero2)
    }
    print("El array generado es: \(numeroaleatorio)")
    
    var contador: [Int:Int] = [:]
    for numero2 in numeroaleatorio {
        contador[numero2, default: 0] += 1
    }
    
    var maxcantidad = 0
    var repetidos = 0
    for (numero2, cantidad) in contador {
        if cantidad > maxcantidad {
            maxcantidad = cantidad
            repetidos = numero2
        }
    }
    print("El elementos que mas se repeti es: \(repetidos)")
    
    var ausentes:[Int] = []
    for i in -30...30 {
        if !numeroaleatorio.contains(i) {
            ausentes.append(i)
        }
    }
    print("Los numero que no estan presentes son:")
    print(ausentes)
    
    
    // Hacer una función que, dada una palabra (String) o frase, diga si la misma es palíndromo o  no.
    //Una palabra/frase palíndromo es aquella que se lee igual tanto de atrás para adelante,  como de
    //adelante  para  atrás.  Ejemplos  de  palíndromos:  "MADAM",  "RACECAR",  "AMORE,   ROMA",
    //"BORROW OR ROB", "WAS IT A CAR OR A CAT I SAW?".
    
    let texto = ["MADAM", "RACECAR", "HELLO", "AMORE, ROMA", "WAS IT A CAR OR A CAT I SAW?"]
    
    func polindromo ( texto : String) -> Bool {
        let txtcompleto = texto.lowercased().filter { $0.isLetter}
        
        return txtcompleto == String(txtcompleto.reversed())
        
    }
    
    for texto in texto {
        if polindromo(texto: texto){
            print("\(texto) es un palindromo")
        }else {
            print("\(texto) no es un polindromo")
        }
    }
    
    //Dada una cadena de caracteres (String) de longitud desconocida que tiene solamente dígitos,
    //crear un array de N elementos (donde N es el tamaño de la cadena) que tenga cada uno de los
    //valores numéricos de los dígitos.
    
    let caracter = "123456789"
    var arraynumero:[Int] = []
    
    for cadena in caracter {
        if let numero = Int(String(cadena)) {
            arraynumero.append( numero)
        }
    }
    print("El arreglo es: \(arraynumero)" )
    
}
