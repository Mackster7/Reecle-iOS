//
//  ViewController.swift
//  Reecle
//
//  Created by Syed Mansoor on 12/04/23.
//

import UIKit

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
        guard let uname = userNameTextField.text, !uname.isEmpty else {
            print("username is empty")
            return
        }
        guard let upass = passwordTextField.text, !upass.isEmpty else {
            print("password is empty")
            return
        }
        let nextViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomePageController") as! HomeViewController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}

