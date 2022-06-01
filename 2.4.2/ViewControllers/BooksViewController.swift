//
//  BooksViewController.swift
//  2.4.2
//
//  Created by Александр on 01.06.2022.
//

import UIKit

class BooksViewController: UIViewController {

    @IBOutlet var atlant: UIImageView!
    @IBOutlet var theThreeMusketeers: UIImageView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atlant.image = UIImage(named: user.person.books[0])
        theThreeMusketeers.image = UIImage(named: user.person.books[1])
        // Do any additional setup after loading the view.
    }
    


}
