//
//  PokemonDetailViewModel.swift
//  PokemonDemo
//
//  Created by Sagar Moradia on 22/05/24.
//

import Foundation

@MainActor
class PokemonDetailViewModel: ObservableObject {
    
    // MARK: - Wrapped Properties
    @Published var detail: PokemonDetail?
    
    // MARK: - Methods
    func fetchDetail(url: String) async {
        do {
            let pokemonDetail: PokemonDetail = try await APIManager.shared.request(url: url)
            self.detail = pokemonDetail
        } catch {
            print(error)
        }
    }
}
