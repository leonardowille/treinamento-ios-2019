//
//  FavoriteCollectionViewCell.swift
//  Pokedex
//
//  Created by user default on 19/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gradientView: GradientView!
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokemonIconTypeView: PokemonIconTypeView!
    @IBOutlet weak var pokemonSecundaryIconTypeView: PokemonIconTypeView!
    @IBOutlet weak var strongestStatsLabel: UILabel!
    @IBOutlet weak var strongestStasValueLabel: UILabel!
    
    func config(with model: Pokemon) {
        self.pictureImageView.loadImage(from: model.image)
        self.nameLabel.text = model.name.capitalized
        if let strongestStats = model.strongestStats {
            self.strongestStatsLabel.text = strongestStats.name.uppercased()
            self.strongestStasValueLabel.text = "\(strongestStats.value)"
        }
        
        if let type = model.mainType {
            self.pokemonIconTypeView.config(type: type)
            self.gradientView.startColor = type.color ?? .black
            self.gradientView.endColor = type.color?.lighter() ?? .white
        }
        pokemonSecundaryIconTypeView.isHidden = false
        if model.types.count > 1 {
            self.pokemonSecundaryIconTypeView.config(type: model.types[1])
        } else {
            pokemonSecundaryIconTypeView.isHidden = true
        }
    }
}
