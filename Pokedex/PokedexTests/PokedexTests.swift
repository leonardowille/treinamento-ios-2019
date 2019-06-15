//
//  PokedexTests.swift
//  PokedexTests
//
//  Created by user default on 15/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import XCTest

class PokedexTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let jsonURL = Bundle(for: PokedexTests.self).url(forResource: "pokemons", withExtension: "json")!
        let data = try! Data(contentsOf: jsonURL)
        print(String(data: data, encoding: .utf8))
    }
}
