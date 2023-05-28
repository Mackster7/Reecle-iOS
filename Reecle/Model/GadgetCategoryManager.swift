//
//  GadgetCategoryManager.swift
//  Reecle
//
//  Created by Syed Mansoor on 28/05/23.
//

import Foundation

class GadgetCategoryManager {
    func fetchCategories(completion: @escaping ([GadgetCategoryData]?, Error?) -> Void) {
            guard let url = URL(string: "http://127.0.0.1:5000/api/gadget_category") else {
                completion(nil, nil) // Handle URL creation error
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(nil, error) // Handle network error
                    return
                }
                
                guard let data = data else {
                    completion(nil, nil) // Handle empty response
                    return
                }
                
                do {
                    let categories = try JSONDecoder().decode([GadgetCategoryData].self, from: data)
                    completion(categories, nil)
                } catch {
                    completion(nil, error) // Handle JSON decoding error
                }
            }
            
            task.resume()
        }
}
