//
//  PokedexUITests.swift
//  PokedexUITests
//
//  Created by user default on 15/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import XCTest

class PokedexUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        
        let app = XCUIApplication()
        app.launchArguments = ["UITests"]
        
        let cells = app.descendants(matching: .cell)
        let fisrtCell = cells.firstMatch
        fisrtCell.tap()
        
        XCTAssertTrue(app.otherElements["detailView"].waitForExistence(timeout: 1))
     }
    
}
