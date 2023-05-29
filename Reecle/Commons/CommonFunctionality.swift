//
//  CommonFunctionality.swift
//  Reecle
//
//  Created by Syed Mansoor on 28/05/23.
//

import Foundation
import UIKit

class CommonFunctionalityClass: UIViewController {
    var navigateBack: UIImageView?
       
    func setupNavigateBackGesture(for imageView: UIImageView) {
        navigateBack = imageView
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        navigateBack?.addGestureRecognizer(tapGesture)
        navigateBack?.isUserInteractionEnabled = true
    }
       
    @objc private func imageTapped(_ gesture: UITapGestureRecognizer) {
        guard let imageView = gesture.view as? UIImageView else {
            return
        }
           
        // Handle the tap on the UIImageView here
        if imageView == navigateBack {
            // Perform the navigation back logic
            navigationController?.popViewController(animated: true)
        }
    }
}
