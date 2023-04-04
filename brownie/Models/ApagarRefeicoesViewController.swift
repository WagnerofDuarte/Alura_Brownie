//
//  ApagarRefeicoesViewController.swift
//  brownie
//
//  Created by Wagner Duarte on 16/03/23.
//

import UIKit

class ApagarRefeicoesViewController {
    
    //MARK: - Atributos
    
    let controller: UIViewController
    
    //MARK: - Inicializador
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void){
        
        let alerta = UIAlertController(title: refeicao.nome, message: refeicao.mostrarDetalhesItens(), preferredStyle: .alert)
        let botaoCancelar = UIAlertAction(title: "OK", style: .cancel)
        let botaoApagar = UIAlertAction(title: "Apagar", style: .destructive, handler: handler)
        
        alerta.addAction(botaoCancelar)
        alerta.addAction(botaoApagar)
        
        controller.present(alerta, animated: true, completion: nil)
        
    }
    
    
}
