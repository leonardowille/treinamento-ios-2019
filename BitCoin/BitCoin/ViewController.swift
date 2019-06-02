//
//  ViewController.swift
//  BitCoin
//
//  Created by user default on 01/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layer0 = CAGradientLayer()
        layer0.colors = [
            UIColor(red: 0.25, green: 0.24, blue: 0.4, alpha: 1).cgColor,
            UIColor(red: 0.04, green: 0.04, blue: 0.07, alpha: 1).cgColor
        ]
        layer0.locations = [0, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: -0.41, b: 0.99, c: -0.99, d: -0.41, tx: 0.44, ty: 0.01))
        layer0.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
        layer0.position = view.center
//        view.layer.addSublayer(layer0)
        view.layer.insertSublayer(layer0, at: 0)
        
//        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchBtc(_ sender: Any) {
        self.performSegue(withIdentifier: "show-detail", sender: nil)
    }
    
}

