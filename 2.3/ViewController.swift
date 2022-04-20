//
//  ViewController.swift
//  2.3
//
//  Created by Александр on 19.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var logIn: UIButton!
    @IBOutlet var forgotUserName: UIButton!
    @IBOutlet var forgotPassword: UIButton!
    
    private let userName: String = "User"
    private let password: String = "Password"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.layer.cornerRadius = 10
        passwordTF.layer.cornerRadius = 10
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
            welcomeVC.helloUser = "Hello, \(userName)"
    }
    // Метод для скрытия клавиатуры тапом по экрану
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super .touchesBegan(touches, with: event)
//    }
    func shouldPerformSegue() -> Bool {
        if let username = userNameTF.text,
           let password = passwordTF.text,
           self.userName == username,
           self.password == password {
            return true
        } else {
            return false
        }
    }
    @IBAction func alerts(_ sender: UIButton) {
        switch sender {
        case forgotUserName:
                let alertVC = UIAlertController(title: "User Name",
                                                message: "Your username is \(userName)",
                                                preferredStyle: .alert)
                let action = UIAlertAction(title: "OK",
                                           style: .default,
                                           handler: nil)
                alertVC.addAction(action)
                present(alertVC,
                        animated: true,
                        completion: nil)
        case forgotPassword:
            let alertVC = UIAlertController(title: "Password",
                                            message: "Your password is \(password)",
                                            preferredStyle: .alert)
            let action = UIAlertAction(title: "OK",
                                       style: .default,
                                       handler: nil)
            alertVC.addAction(action)
            present(alertVC,
                    animated: true,
                    completion: nil)
        default:
            if shouldPerformSegue() {
                return
            } else {
                passwordTF.text = nil
                let alertVC = UIAlertController(title: "Error",
                                                message: "Invalid your user name or password",
                                                preferredStyle: .alert)
                let action = UIAlertAction(title: "OK",
                                           style: .default,
                                           handler: nil)
                alertVC.addAction(action)
                present(alertVC,
                        animated: true,
                        completion: nil)
            }
        }
    }
}
