//
//  ItemsViewModel.swift
//  Inventory
//
//  Created by JOSEPH KERR on 2/7/22.
//

import Foundation


// MARK: Data Model

enum InStockStatus {
    case inStock(Int)
    case outOfStock
}

struct Item {
    var name: String = ""
    var inStock: InStockStatus = .outOfStock
}

typealias Items = [Item]

// MARK: View Model

typealias OnChangeHandler = () -> Void
typealias OnSelectionHandler = (_ item: ItemModel) -> Void

protocol ItemsViewModeling {
    func itemAtIndex(_ index: Int) -> ItemModel
    var count: Int { get }
    var onChange: OnChangeHandler? { get set }
    func addItem(_ item: ItemModel)
    func deleteItem(_ item: ItemModel)
    func newItem() -> ItemModel
    func onSelected(_ index: Int)
    var onSelection: OnSelectionHandler? { get set }
}

class ItemsViewModel: ItemsViewModeling {
    var onSelection: OnSelectionHandler?
    
    func onSelected(_ index: Int) {
        onSelection?(itemAtIndex(index))
    }
    
    func newItem() -> ItemModel {
        let newViewModel: ItemModel = ItemViewModel()
        newViewModel.onAdd = { [weak self] in
            self?.addItem($0)
        }
        newViewModel.onDelete = { [weak self] in
            self?.deleteItem($0)
        }
        return newViewModel
    }
    
    func itemAtIndex(_ index: Int) -> ItemModel {
        return itemViewModels[index]
    }
    
    var onChange: OnChangeHandler?
    
    func addItem(_ item: ItemModel) {
        itemViewModels.append(item)
        onChange?()
    }
    
    func deleteItem(_ item: ItemModel) {
        if let index = itemViewModels.firstIndex(where: { $0 === item }) {
            itemViewModels.remove(at: index)
            onChange?()
        }
    }
    
    var itemViewModels: [ItemModel] = []
    var count: Int { itemViewModels.count }
}
