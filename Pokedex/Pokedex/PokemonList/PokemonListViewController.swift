//
//  ViewController.swift
//  Pokedex
//
//  Created by Juliano Nardon on 07/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

protocol PokemonListViewType: AnyObject {
    func reloadData()
}

class PokemonListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIView!
    
    private let presenter = PokemonListViewPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configTable()
        self.presenter.view = self
        self.presenter.fetchData()
    }

    private func configTable() {
        self.tableView.delegate = self
        self.tableView.dataSource = self.presenter
    }

}

extension PokemonListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = self.storyboard
        if let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            
            detailViewController.pokemon = self.presenter.pokemon(at: indexPath.row)
            navigationController?.present(detailViewController, animated: true)
        }
    }
}

extension PokemonListViewController: PokemonListViewType {
    func reloadData(){
        self.activityIndicator.isHidden = true
        self.tableView.reloadData()
    }
}