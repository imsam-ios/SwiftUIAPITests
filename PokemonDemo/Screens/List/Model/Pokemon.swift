//
//  Pokemon.swift
//  PokemonDemo
//
//  Created by Sagar Moradia on 22/05/24.
//

import Foundation

/**
 An object representing a data for our pokemon list.
 
 Primarily displayed in ``PokemonListView``.
 */
struct PokemonData : Codable {
    let count : Int
    let next : String
    let previous : String?
    let results : [Pokemon]
}

struct Pokemon : Codable {
    let name : String
    let url : String
}
