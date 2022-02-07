//
//  ViewController.swift
//  Inventory
//
//  Created by JOSEPH KERR on 2/7/22.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel: ItemsViewModeling = ItemsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func addPressed(_ sender: Any) {
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "ItemView") as? ItemViewController else { return }
        let viewModel: ItemModel = ItemViewModel()
        viewModel.onAdd? = { [weak self] in
            self?.viewModel.addItem($0)
            
        }
        viewModel.onDelete? = { [weak self] in
            self?.viewModel.deleteItem($0)
        }

        viewController.viewModel = ItemViewModel()
        
        present(viewController, animated: true, completion: nil)
        
        
    }
    
    private var itemsView: ItemsTableViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        itemsView = segue.destination as? ItemsTableViewController
        itemsView?.viewModel = viewModel
    }


}

