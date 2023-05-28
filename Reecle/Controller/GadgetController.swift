//
//  GadgetController.swift
//  Reecle
//
//  Created by Syed Mansoor on 28/05/23.
//

import Foundation

class GadgetController {
    private let service: GadgetCategoryManager
    
    init(service: GadgetCategoryManager) {
        self.service = service
    }
    
    func fetchCategories() {
        service.fetchCategories { (categories, error) in
            if let error = error {
                // Handle the error (e.g., display an error message to the user)
                print("Error: \(error)")
                return
            }
            
            if let categories = categories {
                // Update the view with the fetched categories
                print(categories)
                // Call a delegate method or use a closure to pass the categories to the view controller
            }
        }
    }
}
