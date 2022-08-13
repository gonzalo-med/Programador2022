#Ejercicio 9
Historial5 = (8520, 9510, 7530, 3570, 1590)

def valorMaximo(tupl):
    numMax = 0
    for num in tupl:
        if num > numMax:
            numMax = num
    return numMax

print(valorMaximo(Historial5))