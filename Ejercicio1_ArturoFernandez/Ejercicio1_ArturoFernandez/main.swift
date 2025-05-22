import Foundation
func clase() {
    //Declara dos variables numéricas (con el valor que desees), muestra por consola la suma, resta,
    //multiplicación, división y módulo (resto de la división).
    let numero1:Int = 20
    let numero2:Int = 8
    print ("El numero 1 es \(numero1) y el numero 2 es \(numero2)")
    print ("La suma de ambos numeros es: \(numero1 + numero2)")
    print ("La resta de ambos numeros es: \(numero1 - numero2) ")
    print ("La multiplicacion de ambos numeros es: \(numero1 * numero2)")
    print ("La division de ambos numeros es: \(numero1 / numero2)")
    print ("El modulo de de ambos numeros es: \(numero1 % numero2)")
    
    //Declara 2 variables numéricas (con el valor que desees), he indica cual es mayor de los dos. Si
    //son iguales indicarlo también. Ves cambiando los valores para comprobar que funciona
    
    var number1:Int = 34
    var number2:Int = 12
    if number1 > number2 {
        print("El numero \(numero1) es mayor a \(number2)")
    }
    number1 = 12
    number2 = 12
    if number1 == number2{
        print("Ahora los numeros son: \(number1),\(number2) entonces ambos numeros son iguales")
    }
    
    //Declara  un  String  que  contenga  tu  nombre, después muestra un mensaje de bienvenida por
    //consola. Por ejemplo: si introduzco “Fernando”, me aparece “Bienvenido Fernando”.
    //Modifica la aplicación anterior, para que nos pida el nombre que queremos introducir.
    
    print("Ingresa tu nombre: ")
    if let nombre = readLine(){
        print("Bienvenido \(nombre)")
    }
        
        //Lee  un  número  por  teclado  e  indica  si  es  divisible  entre  2  (resto = 0). Si no lo es, también
        //debemos indicarlo.
        
        print("Ingresa un numero para saber si es divisible entre 2: ")
        if let input = readLine(), let numero = Int(input){
            if numero % 2 == 0{
                print("El numero es divisible entre 2")
            }else {
                print("El numero no es divisible entre 2")
            }
        }
            
            //Lee un número por teclado que pida el precio de un producto (puede tener decimales) y calcule
            //el precio final con IVA. El IVA será una constante que será del 10%
            
            print("Ingrese el precio del producto: ")
            if let input = readLine(), let precio = Double(input){
                let iva:Double = precio * 0.10
                let total:Double = precio + iva
                print("El precio es de: \(precio), con el IVA del 10% quedaria en un precio total de \(total)")
            }else{
                print("Precio del producto invalido")
            }
    
    //Muestra los números del 1 al 100 (ambos incluidos) divisibles entre 2 y 3.
    for numerosdivisibles in 1...100{
        if numerosdivisibles % 2 == 0{
            print("El numero \(numerosdivisibles) es divisible entre 2")
        }else if numerosdivisibles % 3 == 0 {
            print("El numero \(numerosdivisibles) es divisible entre 3")
        }
    }
    
    //Lee un número por teclado y comprueba que este número es mayor o igual que cero, si no lo es
    //lo volverá a pedir (do while), después muestra ese número por consola
    print ("Ingrese un numero:")
    var numero3:Int = -1
    repeat {
        if let input = readLine(), let valor = Int(input){
            if valor >= 0 {
                numero3 = valor
            }else {
                print("Numero invalido, tiene que ser un numero entero")
            }
        }
    } while numero3 < 0
        print("El numero mayor o igual a cero es: \(numero3)")
        
        //Escribe una aplicación con un String que contenga una contraseña cualquiera. Después se te
        //pedirá  que  introduzcas  la  contraseña,  con  3  intentos.  Cuando  aciertes  ya  no  pedirá  más  la
        //contraseña y mostrará un mensaje diciendo “Correcto!”. Piensa bien en la condición de salida (3
        //intentos y si acierta sale, aunque le queden intentos, si no acierta en los 3 intentos mostrar el
        //mensaje “Fallaste jaja!!”).
        
        let password:String = "Hola123"
        
        for intentos in stride(from: 3, through: 1, by: -1){
            print("Adivina la contraseña: ")
            if let contraseña = readLine(){
                print("Te quedan \(intentos) intentos")
                if contraseña == password {
                    print("Correcto adivinaste la contraseña")
                    print("Lo adivinaste en \(intentos) intentos")
                    break
                }else if intentos <= 1 && contraseña != password{
                    print("Fallaste jajaja")
                }
            }
        }
    
    //Crea una aplicación que nos pida un día de la semana y que nos diga si es un día laboral o no
    //(“De lunes a viernes consideramos días laborales”).
    print("Ingrese un dia de la semana: ")
    if let day = readLine(){
        switch day{
        case "Lunes","Martes", "Miercoles", "Jueves", "Viernes":
            print("Es un dia laboral")
            
        case "Sabado", "Domingo":
            print("No es un dia laboral")
        default:
            print("Dia introducido invalido")
        }
    }
        
        }
