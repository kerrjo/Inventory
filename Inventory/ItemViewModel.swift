//
//  ItemViewModel.swift
//  Inventory
//
//  Created by JOSEPH KERR on 2/7/22.
//

import Foundation

typealias ItemChangeHandler =  (ItemModel) -> ()

protocol ItemModel: AnyObject {
    var name: String { get }
    var quantity: String { get }
    var stockStatus: Bool { get }
    var onAdd: ItemChangeHandler? { get set }
    var onDelete: ItemChangeHandler? { get set }
}

class ItemViewModel: ItemModel {
    var onAdd: ItemChangeHandler?
    var onDelete: ItemChangeHandler?
    
    var name: String = ""
    var quantity: String = ""
    var stockStatus: Bool = false
    
    init(with item: Item? = nil) {
        if let item = item {
            name = item.name
            switch item.inStock {
            case .inStock(let qty):
                quantity = "\(qty)"
                stockStatus = true
            case .outOfStock:
                quantity = "0"
                stockStatus = false
            }
        }
    }
}
