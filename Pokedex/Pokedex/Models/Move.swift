//
//  Move.swift
//  Pokedex
//
//  Created by user default on 08/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

struct Move: Codable {
    let name: String
    let learnLevel: Int
    let type: PokemonType
}

typealias Moves = [Move]
