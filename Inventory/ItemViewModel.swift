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
    var isNew: Bool { get set }
    var onAdd: ItemChangeHandler? { get set }
    var onDelete: ItemChangeHandler? { get set }
    func validQuantity(_ amountText: String?) -> Int?

}

class ItemViewModel: ItemModel {
    var isNew: Bool = true
    
    var onAdd: ItemChangeHandler?
    var onDelete: ItemChangeHandler?
    
    func validQuantity(_ amountText: String? = nil) -> Int? {
        guard let quantity = try? Int(amountText ?? "", format: .number), quantity > 0 else { return nil }
        return quantity
    }
    
    var name: String = ""
    var quantity: String = ""
    var stockStatus: Bool = false
    
    init(with item: Item? = nil, new: Bool = true) {
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
        isNew = new
    }
}
