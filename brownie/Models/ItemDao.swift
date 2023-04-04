//
//  ItemDao.swift
//  brownie
//
//  Created by Wagner Duarte on 17/03/23.
//

import Foundation

class ItemDao {
    
    func save(_ listaDeItens: [Item]){
        
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: listaDeItens, requiringSecureCoding: false)
            guard let caminho = recuperaDiretorio() else { return }
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recuperaDiretorio() -> URL? {
        
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appending(path: "Itens")
        
        return caminho
    }
    
    func recupera() -> [Item]{
        
        guard let caminho = recuperaDiretorio() else { return [] }
        
        do {
            let dados = try Data(contentsOf: caminho)
            let itensSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as! [Item]
            return itensSalvos
            
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
