//
//  ViewController.swift
//  2.4.2
//
//  Created by Александр on 29.04.2022.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let user = User.getUserData()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            }
            else if let navigationVC = viewController as? UINavigationController {
                if let aboutMeVC = navigationVC.topViewController as? AboutMeViewController {
                    if let myPhotoVC = aboutMeVC as? MyPhotoViewController {
                       myPhotoVC.user = user
                    } else if let booksVC = aboutMeVC.navigationController?.topViewController as? BooksViewController {
                       booksVC.user = user
                   }
               } 
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func forgotData(_ sender: UIButton) {
        sender.tag == 0 ?
        showAlert(title: "Oops!", message: "Your user name is User 🫡"):
        showAlert(title: "Oops!", message: "Your password is Password 🫡")
    }

    @IBAction func logIn() {
        if userNameTextField.text != user.logIn || passwordTextField.text != user.password {
            showAlert(title: "Access denied",
                      message: "Invalid user name or password",
                      textField: passwordTextField)
            passwordTextField.text = ""
        }
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard let _ = segue.source as? WelcomeViewController else { return }
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
}
extension LogInViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
extension LogInViewController: UITextViewDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logIn()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
}
