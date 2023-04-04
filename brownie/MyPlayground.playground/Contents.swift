import UIKit

var greeting = "Hello, playground"
var teste: Bool = false

// Como fazer for em swift

for i in 0...4{
    print(i)
}

// Como declara um array em swift

var lista = [1,2,3,4,5,6]

// Como percorrer os elementos de uma lista

for elementos in lista{
    print(elementos)
}

//Como uma funcao recebe uma lista como parametro

func funcaoQualquer(listaQualquer: Array<Double>){
    
}

//ou

func funcaoQualquer2(listaQualquer: [Double]){
    
}

// e para poder retornar alguma variavel, declare o tipo da funcao

func funcaoQualquer3(listaQualquer: [Double]) -> Double {
    
    return 0
    
}
