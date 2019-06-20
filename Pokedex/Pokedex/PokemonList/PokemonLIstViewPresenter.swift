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
    
    private lazy var interactor: PokemonListInteractorInput = PokemonListInteractor(output: self)
    
    private let requestMaker = RequestMaker()
    
    private var pokemonList = [Pokemon]()
    
    func pokemon(at index: Int) -> Pokemon{
        return self.pokemonList[index]
    }
    
    private let idsKey = "favorites.ids"
    
    private var favoritesIds: Set<String> = [] {
        didSet {
            print(favoritesIds)
            UserDefaults.standard.set(Array(favoritesIds), forKey: idsKey)
        }
    }
    
    override init() {
        
        if let data = UserDefaults.standard.array(forKey: idsKey) as? [String] {
            self.favoritesIds = Set(data)
        } else {
            self.favoritesIds = []
        }
        
        super.init()
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
        self.interactor.fetchData()
    }
    
    func swipe(at index: Int) {
        let pokemonId = pokemon(at: index).id
        
        guard self.favoritesIds.contains(pokemonId) else {
            self.favoritesIds.insert(pokemonId)
            return
        }
        
        self.favoritesIds.remove(pokemonId)
        
        print(self.favoritesIds)
    }
    
    func swipeAction(for index: Int) -> PokemonSwipeAction {
        return self.favoritesIds.contains(pokemon(at: index).id) ? .removeFavorite : .addFavorite
    }
}

extension PokemonListViewPresenter: PokemonListInteractorOutput {
    func dataFetched(_ data: PokemonList) {
        self.pokemonList = data.pokemons
        DispatchQueue.main.async {
            self.view?.reloadData()
        }
    }
}
