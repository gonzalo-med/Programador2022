#Ejercicio 8
Historial4 = (7510, 7960, 76180, 800, 4100)

def valorMinimo(tupl):
    numMin = 0
    for num in tupl:
        if numMin == 0:
            numMin = num
        if num < numMin:
            numMin = num
    return numMin

print(valorMinimo(Historial4))