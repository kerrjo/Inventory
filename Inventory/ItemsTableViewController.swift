//
//  ItemsTableViewController.swift
//  Inventory
//
//  Created by JOSEPH KERR on 2/7/22.
//

import UIKit

class ItemsTableViewController: UITableViewController {

    var viewModel: ItemsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onChange = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension ItemsTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int { 1 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as UITableViewCell
        
        if let item = viewModel?.itemAtIndex(indexPath.row) {
            cell.textLabel?.text = item.name
            if item.stockStatus {
                cell.detailTextLabel?.text = "\(item.quantity)"
            } else {
                cell.detailTextLabel?.text = "out of stock"
            }
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.onSelected(indexPath.row)
    }
}
