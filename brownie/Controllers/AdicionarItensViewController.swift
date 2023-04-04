//
//  AdicionarItensViewController.swift
//  brownie
//
//  Created by Wagner Duarte on 13/03/23.
//

import UIKit

protocol AdicionaItensDelegate {
    func add(_ item:Item)
}

class AdicionarItensViewController: UIViewController {

    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Atributos
    
    /* Sem o uso dos segues, ja q a tela dessa classe sera criada progamaticamente um delegate (protocolo) sera usado para que as infromacoes sejam passadas sem problemas */
    
    var delegate: AdicionaItensDelegate?
    
    // Se a criação de um init for nesecessaria para o app, alguns padroes devem ser seguidos, dependendo das herancas presentes na classe. Nessa classe, a mae UIViewController demanda que os dois metodos abaixo sejam declarados. O pq? Ainda vou descobrir
    
    init(delegate: AdicionaItensDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Outlets
    
    
    @IBOutlet weak var NomeTextField: UITextField?
    @IBOutlet weak var CaloriasTextField: UITextField?
    
    
    @IBAction func adicionarItem(_ sender: Any) {
        
        guard let nomeDoItem = NomeTextField?.text else { return }
        
        guard let caloriasDoItemString = CaloriasTextField?.text, let caloriasDoItem = Double(caloriasDoItemString) else { return }
        
        let item = Item(nomeDoItem, caloriasDoItem)
        
        print("item \(item.nome) de calorias \(item.calorias) adicionado")
    
        delegate?.add(item)
        navigationController?.popViewController(animated: true)
    }
    
    
}
