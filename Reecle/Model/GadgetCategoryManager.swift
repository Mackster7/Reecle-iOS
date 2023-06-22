//
//  GadgetCategoryManager.swift
//  Reecle
//
//  Created by Syed Mansoor on 28/05/23.
//

import Foundation

class GadgetCategoryManager {
    func fetchCategories(completion: @escaping ([GadgetCategoryData]?, Error?) -> Void) {
        // Simulating data retrieval from a local source
        let localData = getLocalData()
        
        // Check if localData is available
        guard let data = localData else {
            completion(nil, nil) // Handle empty data
            return
        }
        
        do {
            let categories = try JSONDecoder().decode([GadgetCategoryData].self, from: data)
            completion(categories, nil)
        } catch {
            completion(nil, error) // Handle JSON decoding error
        }
    }
    
    private func getLocalData() -> Data? {
        if let path = Bundle.main.path(forResource: "categories", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                // Handle file loading error
                print("Error loading local data: \(error)")
            }
        }
        return nil
    }
}
