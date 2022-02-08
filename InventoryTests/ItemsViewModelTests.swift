//
//  ItemsViewModelTests.swift
//  InventoryTests
//
//  Created by JOSEPH KERR on 2/7/22.
//

import XCTest
@testable import Inventory

class ItemsViewModelTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testNewItem() throws {
        let sut: ItemsModel = ItemsViewModel()
        let newItem = sut.newItem()
        XCTAssertEqual(newItem.name,"")
    }

    func testOnChangeCalledAddItem() throws {
        var sut: ItemsModel = ItemsViewModel()
        let expectation = expectation(description: "onchange")
        sut.onChange = {
            expectation.fulfill()
        }
        let mock = MockItemModel()
        sut.addItem(mock)
        waitForExpectations(timeout: 0.1)
    }
    
    func testOnChangeCalledDeleteItem() throws {
        var sut: ItemsModel = ItemsViewModel()
        let expectation = expectation(description: "onchange")
        expectation.expectedFulfillmentCount = 2 // one for add one for delete
        sut.onChange = {
            expectation.fulfill()
        }
        let mock = MockItemModel()
        sut.addItem(mock)
        let item = sut.itemAtIndex(0)
        sut.deleteItem(item)
        waitForExpectations(timeout: 0.1)
    }
    
    func testOnSelectionCalledWhenSelected() throws {
        var sut: ItemsModel = ItemsViewModel()
        let expectation = expectation(description: "")
        sut.onSelection = { _ in
            expectation.fulfill()
        }
        let mock = MockItemModel()
        sut.addItem(mock)
        sut.onSelected(0)
        waitForExpectations(timeout: 0.1)
    }
}

//typealias ItemChangeHandler =  (ItemModel) -> ()

class MockItemModel: ItemModel {
    var isNew: Bool = true
    func validQuantity(_ amountText: String?) -> Int? { return nil }
    
    var name: String = "test"
    var quantity: String = "0"
    var stockStatus: Bool = false
    
    var onAdd: ItemChangeHandler?
    var onDelete: ItemChangeHandler?
    
    typealias OnAddHandler = ItemChangeHandler
    typealias OnDeleteHandler = ItemChangeHandler

    init(add: OnAddHandler? = nil, delete: OnDeleteHandler? = nil) {
        onAdd = add
        onDelete = delete
    }
}
