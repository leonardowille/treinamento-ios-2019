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
    @IBOutlet weak var primaryTypeImageView: UIImageView!
    @IBOutlet weak var secundaryTypeImageView: UIImageView!
    
    func config(with model: Pokemon) {
        pictureImageView.loadImage(from: model.image)
        nameLabel.text = model.name.capitalized
        
        idLabel.text = String(format: "#%03d", Int(model.id) ?? 0)
        primaryTypeImageView.image = model.types.first?.icon
        primaryTypeImageView.backgroundColor = model.types.first?.color
        
        secundaryTypeImageView.isHidden = false
        if model.types.count > 1 {
            secundaryTypeImageView.image = model.types[1].icon
            secundaryTypeImageView.backgroundColor = model.types[1].color
        } else {
            secundaryTypeImageView.isHidden = true
        }
    }
}
