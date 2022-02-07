//
//  ItemsTableViewController.swift
//  Inventory
//
//  Created by JOSEPH KERR on 2/7/22.
//

import UIKit

class ItemsTableViewController: UITableViewController {

    var viewModel: ItemsViewModeling?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onChange = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int { 1 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as UITableViewCell
        if let item = viewModel?.itemAtIndex(indexPath.row) {
            cell.textLabel?.text = item.name
        }

        return cell
    }

}
