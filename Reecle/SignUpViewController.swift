//
//  SignUpViewController.swift
//  Reecle
//
//  Created by Syed Mansoor on 11/05/23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let btnDesign = UIDesignClass()
    
    @IBOutlet weak var finalSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnDesign.addButtonStyling(btn: finalSignUp)
    }

}
