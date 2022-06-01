//
//  WelcomeViewController.swift
//  2.4.2
//
//  Created by Александр on 29.04.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    var user: User!

    private let primaryColor = UIColor(
        red: 210/255,
        green: 110/255,
        blue: 125/255,
        alpha: 1
    )
    private let secondaryColor = UIColor (
        red: 110/255,
        green: 150/255,
        blue: 230/255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradient(topColor: primaryColor, bottomColor: secondaryColor)
        welcomeLabel.text = User.getUserData().person.fullName
    }
//    @IBAction func unwind(for segue: UIStoryboardSegue) {
//        guard let welcomeVC = segue.source as? LogInViewController else { return }
//        userNameTextField.text = ""
//        user
//    }

}
extension UIView {
    func addVerticalGradient(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
