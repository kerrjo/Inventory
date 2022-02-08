//
//  ItemsViewModel.swift
//  Inventory
//
//  Created by JOSEPH KERR on 2/7/22.
//

import Foundation

typealias OnChangeHandler = () -> Void
typealias OnSelectionHandler = (_ item: ItemModel) -> Void

protocol ItemsModel {
    func itemAtIndex(_ index: Int) -> ItemModel
    var count: Int { get }
    var onChange: OnChangeHandler? { get set }
    func addItem(_ item: ItemModel)
    func deleteItem(_ item: ItemModel)
    func newItem() -> ItemModel
    func onSelected(_ index: Int)
    var onSelection: OnSelectionHandler? { get set }
}

class ItemsViewModel: ItemsModel {
    var onSelection: OnSelectionHandler?
    
    func onSelected(_ index: Int) {
        onSelection?(itemAtIndex(index))
    }
    
    func newItem() -> ItemModel {
        let newViewModel: ItemModel = ItemViewModel(new: true)
        newViewModel.onAdd = { [weak self] in
            self?.addItem($0)
        }
        newViewModel.onDelete = { [weak self] in
            self?.deleteItem($0)
        }
        return newViewModel
    }
    
    func itemAtIndex(_ index: Int) -> ItemModel {
        let model = itemViewModels[index]
        model.onAdd = { [weak self] in
            self?.addItem($0)
        }
        model.onDelete = { [weak self] in
            self?.deleteItem($0)
        }
        return model
    }
    
    var onChange: OnChangeHandler?
    
    func addItem(_ item: ItemModel) {
        item.isNew = false
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
