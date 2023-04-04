//
//  Alerta.swift
//  brownie
//
//  Created by Wagner Duarte on 15/03/23.
//

import UIKit

class Alerta {
    
    //MARK: - Atributos
    
    var controller: UIViewController
    
    //MARK: - Inicializador
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    //MARK: - Metodos
    
    func enviarAlerta(titulo: String = "Erro!", mensagem: String = "Algo de inesperado aconteceu!"){
        
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let butaoOk = UIAlertAction(title: "Ta bom! 😢", style: .cancel)
        alerta.addAction(butaoOk)
        controller.present(alerta, animated: true)
        
    }
    
    
    
}
