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

    
}
