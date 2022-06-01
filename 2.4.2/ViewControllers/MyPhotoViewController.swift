//
//  MyPhotoViewController.swift
//  2.4.2
//
//  Created by Александр on 01.06.2022.
//

import UIKit

class MyPhotoViewController: UIViewController {
    
    @IBOutlet var myPhotoView: UIImageView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPhotoView.image = UIImage(named: user.person.myPhoto)
    }
    

}
