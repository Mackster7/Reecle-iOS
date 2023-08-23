//
//  ViewController.swift
//  Reecle
//
//  Created by Syed Mansoor on 12/04/23.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    let btnDesign = UIDesignClass()
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnDesign.addButtonStyling(btn: signUpBtn)
        btnDesign.addButtonStyling(btn: loginBtn)
    }
    
    @IBAction func validateDataAndNavigateToNextPage(_ sender: Any) {
        verifyLoginData()
    }
    
    func verifyLoginData(){
        let fields = [
               (UITextField: userNameTextField, message: "Username cannot be empty."),
               (UITextField: passwordTextField, message: "Password cannot be empty."),
           ]
           
           for field in fields {
               if field.UITextField!.text!.isEmpty {
                   showAlert(message: field.message)
               }
           }
        
        // Firebase email verification code
        Auth.auth().signIn(withEmail: userNameTextField.text!, password: passwordTextField.text!) { [weak self] authResult, error in
            guard let self = self else { return }
            if let error = error {
                self.showAlert(message: error.localizedDescription)
                return
            }
            
            // Using Storyboard
            let nextViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomePageController") as! HomeViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
            
            // Using Segue
            // self.performSegue(withIdentifier: "HomePageController", sender: self)
        }
    }
    
    private func showAlert(message alertMessage: String){
        let alert = UIAlertController(title: "Unable to login.", message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

