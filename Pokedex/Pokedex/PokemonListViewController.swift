//
//  ViewController.swift
//  Pokedex
//
//  Created by Juliano Nardon on 07/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class PokemonListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let requestMaker = RequestMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configTable()
        
        self.testeAPI()
    }

    private func configTable() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

}

extension PokemonListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemon", for: indexPath)
        
        return cell
    }
}

extension PokemonListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}

extension PokemonListViewController {
    
    func testeAPI() {
//        RequestMaker().make(withEndpoint: .details(query: "7")) { (pokemon: Pokemon) in
//            print(pokemon)
//        }
        RequestMaker().make(withEndpoint: .list) { (pokemonList: PokemonList) in
            print(pokemonList)
        }
    }
}
