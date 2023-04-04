//
//  Item.swift
//  brownie
//
//  Created by Wagner Duarte on 07/03/23.
//

import UIKit

class Item: NSObject, NSCoding {
    //MARK: - Atributos
    
    var nome:String
    var calorias:Double
    
    //MARK: - Inicializador
    
    init(_ nome:String, _ calorias:Double){
        self.nome = nome
        self.calorias = calorias
    }
    
    //MARK: - NSCoding
    
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(calorias, forKey: "calorias")
    }
    
    required init?(coder: NSCoder) {
        nome = coder.decodeObject(forKey: "nome") as! String
        calorias = coder.decodeDouble(forKey: "calorias")
    }
    
}
