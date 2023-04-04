//
//  ViewController.swift
//  tabela-dinamica-refeicoes
//
//  Created by Wagner Duarte on 08/03/23.
//

import UIKit

class ViewController: UITableViewController {
    
    let refeicoes = ["Arroz", "Feijao", "Batata"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //Metodo para definir qtd de linhas na tabela dinamica
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao
        
        return celula
    }

}
