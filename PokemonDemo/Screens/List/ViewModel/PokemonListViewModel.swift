//
//  PokemonViewModel.swift
//  PokemonDemo
//
//  Created by Sagar Moradia on 22/05/24.
//

import Foundation

class PokemonListViewModel: ObservableObject {
    
    private let listService: ListViewServiceDelegate
    
    init(listService: ListViewServiceDelegate = ListViewService()) {
        self.listService = listService
    }
    
    // MARK: - Wrapped Properties
    @Published var data: PokemonData?
    
    // MARK: - Methods
    
    //USING Async/Await
    @MainActor
    func fetchData() async {
        do {
            let pokemonData: PokemonData = try await APIManager.shared.request(url: Constant.API.pokemonListUrl)
            self.data = pokemonData
        } catch {
            print(error)
        }
    }
    
    //USING Closures
    //@MainActor
    func fetchListData() {
        listService.getList { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.data = data
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
