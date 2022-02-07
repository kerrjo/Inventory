//
//  ItemViewController.swift
//  Inventory
//
//  Created by JOSEPH KERR on 2/7/22.
//

import UIKit

class ItemViewController: UIViewController {

    var viewModel: ItemModel!
    
    @IBOutlet var inStockStatusSwitch: UISwitch!
    @IBOutlet var quantityLabel: UITextField!
    @IBOutlet var nameLabel: UITextField!
    
    @IBOutlet var deleteButton: UIButton!
    @IBAction func addPressed(_ sender: Any) {
        let status: InStockStatus
        if inStockStatusSwitch.isOn {
            let numberText = quantityLabel.text ?? "0"
            if let quantity = try? Int(numberText, format: .number) {
                status = .inStock(quantity)
            } else {
                // error really
                status = .outOfStock
            }
        } else {
            status = .outOfStock
        }
        let newItemModel = ItemViewModel(with: Item(name: nameLabel.text ?? "", inStock: status))
        
        viewModel.onAdd?(newItemModel)
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func deletePressed(_ sender: Any) {
        viewModel.onDelete?(viewModel)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = viewModel.name
        quantityLabel.text = viewModel.quantity
        inStockStatusSwitch.isOn = viewModel.stockStatus
    }
}
