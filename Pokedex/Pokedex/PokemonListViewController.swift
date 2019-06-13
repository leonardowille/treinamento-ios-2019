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
    @IBOutlet weak var activityIndicator: UIView!
    
    let requestMaker = RequestMaker()
    
    var pokemonList = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configTable()
        
        self.fetchData()
    }

    private func configTable() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

}

extension PokemonListViewController: UITableViewDataSource {
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

extension PokemonListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = self.storyboard
        if let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            
            detailViewController.pokemon = self.pokemonList[indexPath.row]
            navigationController?.present(detailViewController, animated: true)
        }
    }
}

extension PokemonListViewController {
    
    func fetchData() {
        RequestMaker().make(withEndpoint: .list) { (pokemonList: PokemonList) in
            
            self.pokemonList = pokemonList.pokemons
            DispatchQueue.main.async {
                self.activityIndicator.isHidden = true
                self.tableView.reloadData()
            }
        }
    }
}
