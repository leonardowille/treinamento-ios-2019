//
//  PokemonLIstViewPresenter.swift
//  Pokedex
//
//  Created by user default on 15/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit



class PokemonListViewPresenter: NSObject {
    weak var view: PokemonListViewType?
    
    private let requestMaker = RequestMaker()
    
    private var pokemonList = [Pokemon]()
    
    func pokemon(at index: Int) -> Pokemon{
        return self.pokemonList[index]
    }
}

extension PokemonListViewPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemon", for: indexPath)
        
        if let pokemonCell = cell as? PokemonTableViewCell {
            pokemonCell.config(with: pokemonList[indexPath.row])
        }
        
        return cell
    }
}

extension PokemonListViewPresenter {
    
    func fetchData() {
        RequestMaker().make(withEndpoint: .list) { (pokemonList: PokemonList) in
            
            self.pokemonList = pokemonList.pokemons
            DispatchQueue.main.async {
                self.view?.reloadData()
            }
        }
    }
}

