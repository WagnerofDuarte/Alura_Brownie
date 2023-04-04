//
//  RefeicoesTableViewController.swift
//  brownie
//
//  Created by Wagner Duarte on 08/03/23.
//

import UIKit

// O protocolo AdicionarRefeicaoDelegate deve ser herdado na classe "alvo", e conseqeuntemente seus metodos devem ser especificados nesta classe
class RefeicoesTableViewController: UITableViewController, AdicionarRefeicaoDelegate {
    
    var refeicoes: [Refeicao] = []
    
    //Este metodo existe para retornar ao sistema quantas linhas o tebela do TableView deve possuir
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func viewDidLoad() {
        refeicoes = RefeicaoDao().recupera()
    }
    
    //Este metodo existe para preencher as celulas da tabela com informacoes de nosso desejo, retornando a celula personalizada por nós
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil) // celula personalizavel
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(longPress)
        
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        
        return celula
    }

    //Declaracao obrigatoria do corpo da funcao presente no protocolo AdicionarRefeicoesDelegate herdado pela classe
    func adicionar(refeicao:Refeicao){
        
        refeicoes.append(refeicao)
        tableView.reloadData()
        
        RefeicaoDao().save(refeicoes)
        
    }
    
    @objc func mostrarDetalhes(_ gesture:UILongPressGestureRecognizer){
        if(gesture.state == .began){
            
            let celulaPrecionada = gesture.view as! UITableViewCell
            guard let indexDaReCelula = tableView.indexPath(for: celulaPrecionada) else { return }
            let refeicaoSelecionada = refeicoes[indexDaReCelula.row]
            
            ApagarRefeicoesViewController(controller: self).exibe(refeicao: refeicaoSelecionada, handler: {
                alerta in
                self.refeicoes.remove(at: indexDaReCelula.row)
                self.tableView.reloadData()
               
            })
            
        }
    }
    
    //Metodo usado para passar informacoes de uma tela (Controllers) para outra, meio que representando a seta presente nos StoryBoards
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "adicionar"){
            
            guard let viewController = segue.destination as? ViewController else {
                return
            }
            
            viewController.delegate = self
        }
    }
}
