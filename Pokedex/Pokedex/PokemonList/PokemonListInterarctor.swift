//
//  PokemonListInterarctor.swift
//  Pokedex
//
//  Created by user default on 15/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

class PokemonListInteractor {
    private let requestMaker = RequestMaker()
    private weak var output: PokemonListInteractorOutput?
    
    init(output: PokemonListInteractorOutput) {
        self.output = output
    }
}

extension PokemonListInteractor: PokemonListInteractorInput {
    func fetchData() {
        RequestMaker().make(withEndpoint: .list) { (pokemonList: PokemonList) in
            self.output?.dataFetched(pokemonList)
        }
    }
}
