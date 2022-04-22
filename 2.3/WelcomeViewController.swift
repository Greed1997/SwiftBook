//
//  WelcomeViewController.swift
//  2.3
//
//  Created by Александр on 20.04.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var helloTF: UITextField!
    
    var helloUser: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helloTF.text = helloUser
    }
    
//    @IBAction func logOut() {
//        dismiss(animated: true)
//    }
}
