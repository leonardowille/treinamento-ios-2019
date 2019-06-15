//
//  PokemonListPresenterTests.swift
//  PokedexTests
//
//  Created by user default on 15/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

@testable import Pokedex
import XCTest

class PokemonListPresenterTests: XCTestCase {
    
    func testExample() {
        let expectation = XCTestExpectation(description: "")
        
        let presenter = PokemonListViewPresenter()
        let view = PokemonListViewMock {
            expectation.fulfill()
        }
        presenter.view = view
        presenter.fetchData()
        
        wait(for: [expectation], timeout: 1)
    }
    
}

class PokemonListViewMock: PokemonListViewType {
    let fulfill: () -> Void
    
    init(fulfill: @escaping () -> Void) {
        self.fulfill = fulfill
    }
    
    func reloadData() {
        self.fulfill()
    }
}
