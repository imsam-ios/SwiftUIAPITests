//
//  PokemonDetail.swift
//  PokemonDemo
//
//  Created by Sagar Moradia on 22/05/24.
//

import Foundation

struct PokemonDetail : Codable {
    let id: Int
    let name : String
    let base_experience: Int
    let sprites : Sprites
}

struct Sprites : Codable {
    let back_default : String
}
