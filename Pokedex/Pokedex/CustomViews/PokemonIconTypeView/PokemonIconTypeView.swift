//
//  PokemonIconTypeView.swift
//  Pokedex
//
//  Created by user default on 13/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class PokemonIconTypeView: UIView {
    
    let nibName = "PokemonIconTypeView"
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit(){
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        contentView.fixInView(self)
    }
    
    func config(type: PokemonType) {
        self.iconImageView.image = type.icon
        self.contentView.backgroundColor = type.color
    }
}
