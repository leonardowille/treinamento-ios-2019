//
//  PokemonListContract.swift
//  Pokedex
//
//  Created by user default on 15/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

protocol PokemonListViewType: AnyObject {
    func reloadData()
}

//protocol PokemonListPresenterType: UITableViewDataSource {
//    var view: PokemonListViewType? { get set }
//    func fetchData()
//    func pokemon(at index: Int) -> Pokemon
//}

protocol PokemonListInteractorInput {
    
    func fetchData()
    
}
protocol PokemonListInteractorOutput: AnyObject {
    
    func dataFetched(_ data: PokemonList)
    
}
