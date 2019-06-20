//
//  Pokemon.swift
//  Pokedex
//
//  Created by user default on 08/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

struct PokemonResponse: Codable {
    let list: PokemonList
}

struct PokemonList: Codable {
    
    let pokemons: [Pokemon]
}

struct Status: Codable {
    let name: String
    let value: Int
}

struct Pokemon: Codable {
    
    let id: String
    let name: String
    let image: String
    let types: [PokemonType]
    var description: String?
    let stats: [Status]?
    
    var mainType: PokemonType? {
        return self.types.first
    }
    
    var strongestStats: Status? {
        if let stats = self.stats {
            var copiedStats = stats
            copiedStats.sort(by: { (first, second) -> Bool in
                first.value > second.value
            })
            return copiedStats.first
        }
        
        return self.stats?.first
    }
}
