//
//  SignUpViewController.swift
//  Reecle
//
//  Created by Syed Mansoor on 11/05/23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let btnDesign = UIDesignClass()
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var finalSignUp: UIButton!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var navigateBack: UIImageView!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        btnDesign.addButtonStyling(btn: finalSignUp)
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        navigateBack.addGestureRecognizer(tapGR)
        navigateBack.isUserInteractionEnabled = true
    }

    @IBAction func newUserSignUp(_ sender: Any) {
        if validateFields() {
            // Perform signup logic.
        }
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            navigationController?.popViewController(animated: true)
        }
    }
    
    func validateFields() -> Bool {
        if firstNameTextField.text!.isEmpty {
            showErrorLabel(withMessage: "Firstname cannot be empty!")
            return false
        }
        
        if lastNameTextField.text!.isEmpty {
            showErrorLabel(withMessage: "Lastname cannot be empty!")
            return false
        }
        
        if emailTextField.text!.isEmpty {
            showErrorLabel(withMessage: "Email cannot be empty!")
            return false
        }
        
        if passwordTextField.text!.isEmpty {
            showErrorLabel(withMessage: "Password cannot be empty!")
            return false
        }
        
        hideErrorLabel()
        return true
    }

    func showErrorLabel(withMessage message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
    }

    func hideErrorLabel() {
        errorLabel.isHidden = true
    }
}
