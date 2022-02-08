//
//  ItemViewModelTests.swift
//  InventoryTests
//
//  Created by JOSEPH KERR on 2/7/22.
//

import XCTest
@testable import Inventory

class ItemViewModelTests: XCTestCase {

    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }

    func testValidQuantityNilNotValid() throws {
        let sut: ItemModel = ItemViewModel()
        XCTAssertNil(sut.validQuantity(nil))
    }
    
    func testValidQuantityEmptyNotValid() throws {
        let sut: ItemModel = ItemViewModel()
        XCTAssertNil(sut.validQuantity(""))
    }
    
    func testValidQuantityNegativeNotValid() throws {
        let sut: ItemModel = ItemViewModel()
        XCTAssertNil(sut.validQuantity("-3"))
    }
    
    func testValidQuantityNotANumberNotValid() throws {
        let sut: ItemModel = ItemViewModel()
        XCTAssertNil(sut.validQuantity("foo"))
    }
    
    func testValidQuantityZeroNotValid() throws {
        let sut: ItemModel = ItemViewModel()
        XCTAssertNil(sut.validQuantity("foo"))
    }
    
    func testValidQuantity_1_isValid() throws {
        let sut: ItemModel = ItemViewModel()
        XCTAssertNotNil(sut.validQuantity("1"))
        XCTAssertEqual(sut.validQuantity("1")!,1)
    }

    func testValidQuantity_02_isValid() throws {
        let sut: ItemModel = ItemViewModel()
        XCTAssertNotNil(sut.validQuantity("02"))
        XCTAssertEqual(sut.validQuantity("02")!,2)
    }
}
