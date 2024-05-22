//
//  ListService.swift
//  PokemonDemo
//
//  Created by Sagar Moradia on 22/05/24.
//

import Foundation

protocol ListViewServiceDelegate {
    func getList(completion: @escaping ListResultHandler)
}

class ListViewService: ListViewServiceDelegate  {
    
    func getList(completion: @escaping ListResultHandler) {
        APIManager.shared.fetchListData(completion: completion)
    }
}
