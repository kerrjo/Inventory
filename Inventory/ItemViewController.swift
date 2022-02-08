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
        if let quantity = viewModel.validQuantity(quantityLabel.text), inStockStatusSwitch.isOn  {
            status = .inStock(quantity)
        } else {
            status = .outOfStock
        }
        
        viewModel.onAdd?(ItemViewModel(with: Item(name: nameLabel.text ?? "", inStock: status)))
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deletePressed(_ sender: Any) {
        viewModel.onDelete?(viewModel)
        dismiss(animated: true, completion: nil)
    }

    @IBAction func switchValueChanged(_ sender: Any) {
        quantityLabel.isHidden = !inStockStatusSwitch.isOn
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = viewModel.name
        quantityLabel.text = viewModel.quantity
        inStockStatusSwitch.isOn = viewModel.stockStatus
        deleteButton.isHidden = viewModel.isNew
        quantityLabel.isHidden = !inStockStatusSwitch.isOn
    }
}


//            if let quantity = try? Int(quantityLabel.text ?? "0", format: .number) {
//            } else {
//                status = .outOfStock // error really
//            }
