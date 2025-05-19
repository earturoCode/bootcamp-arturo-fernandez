import random
def generar_numero():
    digitos=list("123456789")
    numero= random.choice(digitos)
    digitos=list("0123456789")
    while len(numero) < 4:
        d = random.choice(digitos)
        if d not in numero:
            numero += d
    return numero
def vacas_toros(num_aleatorio, num_digitado):
    toros = sum(a == b for a, b in zip(num_aleatorio, num_digitado))
    vacas = sum(i in num_aleatorio for i in num_digitado) - toros
    return toros,vacas
def jugar():
    num_aleatorio = generar_numero()
    intentos = 0
    while True:
        num_digitado = input("Ingrese un numero de 4 digitos sin digitos repetidos: ")
        intentos+=1
        if not num_digitado.isdigit() or len(num_digitado) != 4 or len(set(num_digitado)) != 4 or num_digitado[0] == '0':
            print("Datos invalidos, vuelva a intentar de nuevo!!! ")
            continue
        toros,vacas = vacas_toros(num_aleatorio, num_digitado)
        if toros == 4:
            print(f"Felicidades,Adivinaste el numero {num_aleatorio} en {intentos} intentos, eres un genio!")
            break
        else:
            print(f"{vacas} vacas, {toros} toros. Por favor, vuelva a intentarlo! ")
jugar()