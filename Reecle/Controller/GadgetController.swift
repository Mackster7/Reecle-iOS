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
    
    func fetchCategories(completion: @escaping (Array<String>?, Error?) -> Void) {
        service.fetchCategories { (categories, error) in
            if let error = error {
                // Handle the error (e.g., display an error message to the user)
                print("Error: \(error)")
                completion(nil, error) // Call the completion closure with nil and the error
                return
            }
            
            if let categories = categories {
                // Update the view with the fetched categories
                print(categories)
                // Call the completion closure with the categories
                let categoryArray = categories.map { $0.category }
                print(categoryArray)
                print(type(of: categoryArray))
                completion(categoryArray, nil) // Call the completion closure with the categoryArray and nil error
            }
        }
    }

}
