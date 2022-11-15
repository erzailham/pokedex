//
//  PokemonList.swift
//  Pokedex
//
//  Created by Reza Ilham on 10/11/22.
//

import Foundation

// MARK: - PokemonList
struct PokemonList: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let pokemons: [Pokemon]?
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case pokemons = "results"
    }
}

// MARK: - Pokemon
struct Pokemon: Codable {
    let name: String?
    let url: String?
    
    var imageUrl: String? {
        "https://img.pokemondb.net/artwork/" + (name ?? "") + ".jpg"
    }
}
