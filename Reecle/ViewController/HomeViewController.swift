//
//  HomeViewController.swift
//  Reecle
//
//  Created by Syed Mansoor on 11/05/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let gadgetController = GadgetController(service: GadgetCategoryManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gadgetController.fetchCategories()
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
