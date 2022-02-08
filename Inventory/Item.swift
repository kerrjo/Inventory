//
//  Item.swift
//  Inventory
//
//  Created by JOSEPH KERR on 2/7/22.
//

import Foundation

enum InStockStatus {
    case inStock(Int)
    case outOfStock
}

struct Item {
    var name: String = ""
    var inStock: InStockStatus = .outOfStock
}

typealias Items = [Item]
