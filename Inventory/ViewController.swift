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
    
    private var itemsView: ItemsTableViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        itemsView = segue.destination as? ItemsTableViewController
        viewModel.onSelection = onSelection(_:)
        itemsView?.viewModel = viewModel
    }

    @IBAction func addPressed(_ sender: Any) {
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "ItemView") as? ItemViewController else { return }
        viewController.viewModel = viewModel.newItem()
        present(viewController, animated: true, completion: nil)
    }
    
    func onSelection(_ item: ItemModel) {
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "ItemView") as? ItemViewController else { return }
        viewController.viewModel = item
        present(viewController, animated: true, completion: nil)
    }
}

