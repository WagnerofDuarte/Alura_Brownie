//
//  ViewController.swift
//  brownie
//
//  Created by Wagner Duarte on 14/02/23.
//

import UIKit

/* Protocolos, sao tipo as interfaces de outras linguagens: aqui ela serve para limitar o acesso a informacoes da classe em questao, permitindo o acesso a alguns metodos de escolha, protegendo a classe de mudancas indesejadas*/

protocol AdicionarRefeicaoDelegate { // O protocolo deve ser criado dentro da classe que ira à utilizar, como neste caso em que AdicionarRefeicao é uma funcao que deve vim do RefeicoesViewController
    func adicionar(refeicao:Refeicao) // Os metodos a serem utilizados devem ser declarados sem corpo dentro do protocolo (* outros detalhes na Classe refeicoesTableViewController)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate {
    
    // MARK: - Atributos
    
    var delegate: AdicionarRefeicaoDelegate?
    var itens:[Item] = []
    var itensSelecionados:[Item] = []
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() { // Metodo que dispara assim que a view é carregada, sendo util para adiconar itens na tela progamaticamente
        
        let butaoAdicionaItem = UIBarButtonItem(title: "adiconar", style: .plain, target: self, action: #selector(adicionarItem))
        navigationItem.rightBarButtonItem = butaoAdicionaItem
        recuperaItens()
    }
    
    func recuperaItens( ){
        itens = ItemDao().recupera()
    }
    
    @objc func adicionarItem(){ // O prefixo @objc serve para mostrar ao compilador que um padrao da linguagem objective-c esta sendo usdada, e que sera referenciada no parametro #selector do UIBarButtonItem
        
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_ item: Item) { // Defincao da funcao do protololo herdado: AdicionaItensDelegate
        itens.append(item)
        ItemDao().save(itens)
        if let itensTableView = self.itensTableView {
            itensTableView.reloadData()
        } else {
            Alerta(controller: self).enviarAlerta(titulo: "🚨 Atenção! 🚨", mensagem: " Erro ao atualizar a tabela!")
        }
    }
    
    // MARK: - IBOutlets

    @IBOutlet var nomeTextFild:UITextField?
    @IBOutlet var felicidadeTextField:UITextField?
    
    @IBOutlet weak var itensTableView: UITableView?
    
    //MARK: - TableViewDeIgredientes
    
    //Os metodos abaixo existem para inciar a quantidade de linhas e quais serao seus respectivos dados e comportamentos ao clique do usuario
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        
        celula.textLabel?.text = item.nome
        
        return celula
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        
        if(celula.accessoryType == .none){
            celula.accessoryType = .checkmark
            itensSelecionados.append(itens[indexPath.row])
        } else {
            celula.accessoryType = .none
            if let posicaoDoItem = itensSelecionados.firstIndex(of: itens[indexPath.row]){
                itensSelecionados.remove(at: posicaoDoItem)
            }
            
        }
        
    }
    
    // MARK: - IBActions
    
    @IBAction func adicionar() {
        
        if let refeicao = extrairDadosFormularioRefeicao() {
            delegate?.adicionar(refeicao: refeicao)
            navigationController?.popViewController(animated: true)
        }
    }
    
    func extrairDadosFormularioRefeicao () -> Refeicao? {
        
        /* Solucao com if let*/
        
       /* if let nomeDaRefeicao = nomeTextFild?.text, let felicidadeDaRefeicao = felicidadeTextField?.text {
            if let felicidade = Int(felicidadeDaRefeicao){
                let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
                print("Alimento \(refeicao.nome), de felicidade \(refeicao.felicidade) adicionado!")
            }
        }*/
        
        guard let nomeDaRefeicao = nomeTextFild?.text else { return nil }
        guard let felicidadeDaRefeicaoString = felicidadeTextField?.text, let felicidadeDaRefeicao = Int(felicidadeDaRefeicaoString) else { return nil }
        
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidadeDaRefeicao)
        
        refeicao.itens = itensSelecionados
        
        return refeicao
    }
}
