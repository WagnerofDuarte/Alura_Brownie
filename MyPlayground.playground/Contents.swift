import UIKit

// Para criar e instanciar classes:

class Refeicao {
    var nome: String = "qualquer um"
    let felicidade: Int = 0
    
}

//Como o objeto foi instanciado como um let, constante, ela n podera ser instanciada novamente
let refeicao1 = Refeicao()
refeicao1.nome = "Macarrao"

//Aqui, o objeto pode ser instanciado novamente, pois foi declarado como variavel
var refeicao2 = Refeicao()
refeicao2.nome = "Churros"

// A criacao da classe "Refeicao" foi feita de modo que seus atributos tenham valores iniciais, oque pode ser indesejado varias vezes, para tal use variaveis opcionais, os optionals!
// a interrogacao faz com que essa variavel se torne uma optional, que a exime de ter um valor inicial, e da a responsabilidade de seu preenchimento ao Dev
class Refeicao2 {
    var nome: String?
    var felicidade: Int?
}

var refeicao3 = Refeicao2()

//Evite ao maximo usar o "Forced Unwraped"(!), que forca o compilador a extrair uma informacao de uma variavel optional! Pois caso a variavel esteja vazia, um erro fatal ocorrerá!

// print(refeicao3.nome!)

/* BOAS PRATICAS DO USO DOS OPTIONALS */

//Para proteger a execucao de seu codigo de crashes, use os "if let" e "guard let"
func exibirNomeDaComida(){
    
    //com a tecnica do if let, a constante criada somente podera ser usada dentro do if
    if let nomeDaComida = refeicao3.nome {
        print(nomeDaComida)
    }
    //com a tecnica do guard let, a constante podera ser usada fora de sua declacao
    guard let nomeDaComida2 = refeicao3.nome else {
        return
    }
    
    print(nomeDaComida2)
    
}

/*PARA EVITAR O USO DE OPTIONALS EM SUAS CLASSES, USE CONSTRUTORES*/

class Itens {
    var nome:String
    var calorias:Double
    
    init(nome:String, calorias:Double){
        self.nome = nome
        self.calorias = calorias
    }
}

class Refeicaozona {
    
    var nome:String
    var felicidade:String
    var itens: Array<Itens> = []
    
    init(nome:String, felicidade:String){
        self.nome = nome
        self.felicidade = felicidade
    }
    
    func totalDeCalorias()-> Double {
        var total:Double = 0.0
        
        for caloria in itens{
            total+=caloria.calorias
        }
        return total
    }
}

var refeicao4 = Refeicaozona(nome: "Salada", felicidade: "2")

refeicao4.itens.append(Itens(nome: "arroz", calorias: 67.9))
refeicao4.itens.append(Itens(nome: "feijao", calorias: 45.8))
refeicao4.itens.append(Itens(nome: "contrafile", calorias: 879.9))

print(refeicao4.nome)
print(refeicao4.felicidade)
print(refeicao4.totalDeCalorias())
