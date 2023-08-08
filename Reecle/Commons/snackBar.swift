//
//  snackBar.swift
//  Reecle
//
//  Created by Syed Mansoor on 31/07/23.
//

import Foundation
import UIKit

public class snackBarImplementation: UIViewController {
    
    public func showSnackbar(message: String, duration: TimeInterval = 2.0) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.view.alpha = 0.7
        alertController.view.layer.cornerRadius = 15
        
        self.present(alertController, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                alertController.dismiss(animated: true, completion: nil)
            }
        }
    }
    
}
