//
//  MovesViewController.swift
//  Pokedex
//
//  Created by user default on 08/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class MovesViewController: UIViewController {

    let requestMaker = RequestMaker()
    
    @IBOutlet weak var tableView: UITableView!
    
    var moves = Moves()
    
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

extension MovesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}

extension MovesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.moves.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "move", for: indexPath)

        if let moveCell = cell as? MoveTableViewCell {
            moveCell.config(with: moves[indexPath.row])
        }
        
        return cell
    }
}

extension MovesViewController {
    
    func fetchData() {
        RequestMaker().make(withEndpoint: .moves) { (moves: Moves) in
            self.moves = moves
            print(moves)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
