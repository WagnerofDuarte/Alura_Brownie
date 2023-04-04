//
//  Refeicao.swift
//  brownie
//
//  Created by Wagner Duarte on 07/03/23.
//

import UIKit

class Refeicao: NSObject, NSCoding {
    
    //MARK: - Atributos
    
    var nome:String
    var felicidade:Int
    var itens: Array<Item>
    
    //MARK: - Inicializador
    
    init(nome:String, felicidade:Int, itens: [Item] = []){
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    
    //MARK: - Metodos
    
    func totalDeCalorias()-> Double {
        
        var total:Double = 0.0
        for caloria in itens{
            total+=caloria.calorias
        }
        
        return total
    }
    
    func mostrarDetalhesItens()-> String {
        
        var mensagem:String = "Felicidade: \(felicidade)\nIgredientes:\n"
    
        for item in itens {
            mensagem += "\(item.nome) de valor calorico: \(item.calorias)\n"
        }
        
        return mensagem
    }
    
    //MARK: - NSCoding
    
    func encode(with coder: NSCoder) {
        
        coder.encode(nome, forKey: "nome")
        coder.encode(felicidade, forKey: "felicidade")
        coder.encode(itens, forKey: "itens")
        
    }
    
    required init?(coder: NSCoder) {
        self.nome = coder.decodeObject(forKey: "nome") as! String
        self.felicidade = coder.decodeInteger(forKey: "felicidade")
        self.itens = coder.decodeObject(forKey: "itens") as! Array<Item>
    }
}
