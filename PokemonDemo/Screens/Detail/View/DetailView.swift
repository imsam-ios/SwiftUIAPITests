//
//  DetailView.swift
//  PokemonDemo
//
//  Created by Sagar Moradia on 22/05/24.
//

import SwiftUI

struct DetailView: View {
    
    // MARK: - Wrapped Properties
    
    var pokemonUrl: String
    
    /// The view model for `ListView`.
    @StateObject var viewModel = PokemonDetailViewModel()
    
    
    // MARK: - Body View
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: (viewModel.detail?.sprites.back_default ?? "")))
            
            Text("ID: \(viewModel.detail?.id ?? 0)")
            
            Text("Name: \(viewModel.detail?.name ?? "")")
            
            Text("Base Exp.: \(viewModel.detail?.base_experience ?? 0)")
            
            Spacer()
        }
        .task {
            await viewModel.fetchDetail(url: pokemonUrl)
        }
        .padding()
    }
}

#Preview {
    DetailView(pokemonUrl: "https://pokeapi.co/api/v2/pokemon/1/")
}
