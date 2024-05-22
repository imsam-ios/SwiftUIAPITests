//
//  PokemonListView.swift
//  PokemonDemo
//
//  Created by Sagar Moradia on 22/05/24.
//

import SwiftUI

struct PokemonListView: View {
    
    // MARK: - Wrapped Properties
      
      /// The view model for `ListView`.
      @StateObject var viewModel = PokemonListViewModel()
    
    // MARK: - Body View
    
    var body: some View {
        
        NavigationStack {            
            List {
                ForEach(viewModel.data?.results ?? [], id: \.name) { pkmn in
                    NavigationLink {
                        DetailView(pokemonUrl: pkmn.url)
                    } label: {
                        Text(pkmn.name)
                    }
                }
            }
            .navigationTitle("Pokémons")
        }
        .task {
            await viewModel.fetchData()
        }
    }
}

#Preview {
    PokemonListView()
}
