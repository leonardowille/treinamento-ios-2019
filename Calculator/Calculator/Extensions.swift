//
//  Extensions.swift
//  Calculator
//
//  Created by user default on 26/05/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

extension Double {
    func forTrailingZero() -> String {
        return String(format: "%g", self)
    }
}
