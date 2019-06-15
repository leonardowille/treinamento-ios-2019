//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by user default on 08/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var pokemonIconPrimaryTypeView: PokemonIconTypeView!
    @IBOutlet weak var pokemonIconSecundaryTypeView: PokemonIconTypeView!
    
    func config(with model: Pokemon) {
        pictureImageView.loadImage(from: model.image)
        nameLabel.text = model.name.capitalized
        
        idLabel.text = String(format: "#%03d", Int(model.id) ?? 0)
        if let type = model.types.first {
            self.pokemonIconPrimaryTypeView.config(type: type)
        }
        pokemonIconSecundaryTypeView.isHidden = false
        if model.types.count > 1 {
            self.pokemonIconSecundaryTypeView.config(type: model.types[1])
        } else {
            pokemonIconSecundaryTypeView.isHidden = true
        }
    }
}
