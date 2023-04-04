//
//  RefeicoesDao.swift
//  brownie
//
//  Created by Wagner Duarte on 17/03/23.
//

import Foundation

class RefeicaoDao {
    
    func save(_ refeicoes: [Refeicao]){
        
        guard let caminho = recuperaDiretorio() else { return }
        
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false)
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recuperaDiretorio() -> URL?{
        
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appending(path: "Refeicao")
        
        return caminho
    }
    
    func recupera() -> [Refeicao]{
        
        guard let caminho = recuperaDiretorio() else { return [] }
        
        do {
            
            let dados = try Data(contentsOf: caminho)
            guard let refeicoesSalvas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? Array<Refeicao> else { return [] }
            
            return refeicoesSalvas
            
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
}
