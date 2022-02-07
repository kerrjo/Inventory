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
    
    @IBAction func addPressed(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
