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
        guard let uname = userNameTextField.text, !uname.isEmpty else {
            showSnackbar(message: "username is empty")
            return
        }
        guard let upass = passwordTextField.text, !upass.isEmpty else {
            print("password is empty")
            return
        }
        
        // Firebase email verification code
        Auth.auth().signIn(withEmail: uname, password: upass) { [weak self] authResult, error in
            guard let self = self else { return }
            if let error = error {
                print("Error signing in: \(error.localizedDescription)")
                return
            }
            
            // Using Storyboard
            let nextViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomePageController") as! HomeViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
            
            // Using Segue
            // self.performSegue(withIdentifier: "HomePageController", sender: self)
        }
    }
}

extension ViewController {
    
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

