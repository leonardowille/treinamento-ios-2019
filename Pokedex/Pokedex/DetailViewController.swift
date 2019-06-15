//
//  DetailViewController.swift
//  Pokedex
//
//  Created by user default on 08/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var gradienteView: GradientView!
   
    @IBOutlet weak var pokemonImageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var pokemonImageViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var pokemonImageCenterVerticallyConstraint: NSLayoutConstraint!
    @IBOutlet weak var pokemonImageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var pokemonTypeView: PokemonTypeView!
    @IBOutlet weak var backgroudDetailsView: NSLayoutConstraint!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonDescriptionTextView: UITextView!
    
    var pokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = "detailView"
        self.initialConfig()
        
        self.requestPokemon()
        
        if let type = pokemon?.types.first {
            self.pokemonTypeView.config(type: type)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.loadPokemonAnimation()
    }
    
    func loadPokemonAnimation(){
        
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.imageView.alpha = 0.2
        })
        
//        UIView.animate(withDuration: 1, animations: {
//            self.imageView.alpha = self.imageView.alpha == 1 ? 0.2 : 1
//        }) { _ in
//            self.loadPokemonAnimation()
//        }
    }
    
    func animatePokemonImageToTop(){
        DispatchQueue.main.async {
            self.imageView.layer.removeAllAnimations()
            self.pokemonImageCenterVerticallyConstraint.priority = UILayoutPriority(900)
            self.pokemonImageViewTopConstraint.priority = UILayoutPriority(999)
            self.pokemonImageViewHeightConstraint.constant = 80
            self.pokemonImageViewWidthConstraint.constant = 80
            self.backgroudDetailsView.constant = -20            
            
            UIView.animate(withDuration: 1, animations: {
                self.imageView.alpha = 1
                self.view.layoutIfNeeded()
            })
        }
    }
    
    func initialConfig() {
        if let pokemon = self.pokemon {
            self.gradienteView.startColor = pokemon.types.first?.color ?? .black
            self.gradienteView.endColor = pokemon.types.first? .color?.lighter() ?? .white
            
            self.imageView.loadImage(from: pokemon.image)
            DispatchQueue.main.async {
                self.pokemonNameLabel.text = pokemon.name.capitalized
                // Essa merda ta vindo nil
                if let description = pokemon.description {
                    self.pokemonDescriptionTextView.text = description
                }
//                self.pokemonDescriptionTextView.text = "After birth, its\nback swells and\nhardens into a shell. Powerfully\nsprays foam from\nits mouth."
                
            }
        }
    }
    
    func requestPokemon(){
        if let pokemon = self.pokemon {
            RequestMaker().make(withEndpoint: .details(query: pokemon.id)) { (pokemon: Pokemon) in
                self.pokemon = pokemon
                self.animatePokemonImageToTop()
            }
        }
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
