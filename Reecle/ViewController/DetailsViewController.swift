//
//  DetailsViewController.swift
//  Reecle
//
//  Created by Syed Mansoor on 03/07/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var labelData : String = ""
    
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "Enter Your \(labelData) Details"
    }
    
}
