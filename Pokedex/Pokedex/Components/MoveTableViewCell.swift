//
//  MoveTableViewCell.swift
//  Pokedex
//
//  Created by user default on 09/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class MoveTableViewCell: UITableViewCell {

    @IBOutlet weak var moveLabel: UILabel!
    @IBOutlet weak var typeImageView: UIImageView!
    
    func config(with model: Move){
        DispatchQueue.main.async {
            self.moveLabel.text = model.name.capitalized
            self.typeImageView.image = model.type.icon
            self.typeImageView.backgroundColor = model.type.color
        }
    }
}
