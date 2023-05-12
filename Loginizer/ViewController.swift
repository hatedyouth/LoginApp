//
//  ViewController.swift
//  Loginizer
//
//  Created by Тимур Турлыкин on 09.05.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
    private let user = User.getUserData()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let welcomeVC = tabBarController.viewControllers?.first as! WelcomeViewController
        let navigationVC = tabBarController.viewControllers?.last as! UINavigationController
        let aboutVC = navigationVC.topViewController as! AboutViewController
        let bioVC =  navigationVC.viewControllers as! BioViewController
        welcomeVC.user = user
        aboutVC.user = user
        bioVC.user = user
//        
        
        
        
        
//        guard let welcomeVC = segue.destination as?  WelcomeViewController else {return}
//        welcomeVC.user = user
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 10
    }
    
    
    @IBAction func logInTap() {
        guard loginTF.text == user.login,
              passwordTF.text == user.password
        else {
            showAlert(title: "Invalid login or password",
                      message: "Please, enter correct login and password",
                      textField: passwordTF)
            return
        }
        performSegue(withIdentifier: "LogIn", sender: nil)
    }
    
    @IBAction func forgotLoginPassword(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", message: "Your name is \(user.login)")
        : showAlert(title: "Oops!", message: "Your password is \(user.password)")
        
    }
    

    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        loginTF.text = nil
        passwordTF.text = nil
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    
    
    
}



extension LoginViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInTap()
        }
        return true
    }
}

