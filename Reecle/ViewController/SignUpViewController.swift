//
//  SignUpViewController.swift
//  Reecle
//
//  Created by Syed Mansoor on 11/05/23.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    let uiDesign = UIDesignClass()
    let commonFunctionality = CommonFunctionalityClass()
    
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
        uiDesign.addButtonStyling(btn: finalSignUp)
        //commonFunctionality.setupNavigateBackGesture(for: navigateBack)
        navigateBackToPreviousScreen()
    }

    @IBAction func newUserSignUp(_ sender: Any) {
        if validateFields() {
            registerUser()
        }
    }
    
    func navigateBackToPreviousScreen(){
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        navigateBack.addGestureRecognizer(tapGR)
        navigateBack.isUserInteractionEnabled = true
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            navigationController?.popViewController(animated: true)
        }
    }
    
    func validateFields() -> Bool {
        let fields = [
               (UITextField: firstNameTextField, message: "Firstname cannot be empty."),
               (UITextField: lastNameTextField, message: "Lastname cannot be empty."),
               (UITextField: emailTextField, message: "Email cannot be empty."),
               (UITextField: passwordTextField, message: "Password cannot be empty.")
           ]
           
           for field in fields {
               if field.UITextField!.text!.isEmpty {
                   let alert = UIAlertController(title: "Unable to register the user.", message: field.message, preferredStyle: .alert)
                   alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: nil))
                   present(alert, animated: true, completion: nil)
                   return false
               }
           }
        
        hideErrorLabel()
        return true
    }
    
    func registerUser(){
        // Register user with email and password
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authResult, error in
            guard let user = authResult?.user, error == nil else {
                print("Error: \(error!.localizedDescription)")
                return
            }

            // Send email verification
            user.sendEmailVerification { error in
                if let error = error {
                    print("Error sending email verification: \(error.localizedDescription)")
                    return
                }
                print("Email verification sent to \(user.email!)")
                let nextViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomePageController") as! HomeViewController
                self.navigationController?.pushViewController(nextViewController, animated: true)
            }
        }
    }

    func showErrorLabel(withMessage message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
    }

    func hideErrorLabel() {
        errorLabel.isHidden = true
    }
}
