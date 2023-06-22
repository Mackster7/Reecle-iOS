//
//  HomeViewController.swift
//  Reecle
//
//  Created by Syed Mansoor on 11/05/23.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate {
    
    var categories : [String] = ["Apple","Mango","Bananna"]
    @IBOutlet weak var categoryTable: UITableView!
        
    private let gadgetController = GadgetController(service: GadgetCategoryManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gadgetController.fetchCategories { (categoryArray, error) in
            if let error = error {
                // Handle the error
                print("Error: \(error)")
                return
            }
            
            if let categoryArray = categoryArray {
                self.categories = categoryArray
            }
        }
        categoryTable.delegate = self
        categoryTable.dataSource = self
    }

    
}

extension HomeViewController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }

}
