//
//  ViewController.swift
//  Loginizer
//
//  Created by Тимур Турлыкин on 09.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var LoginTF: UITextField!
    @IBOutlet weak var PasswordTF: UITextField!
    
    @IBOutlet weak var LogInButton: UIButton!
    
    private let user = User.getUserData()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as?  WelcomeViewController else {return}
        welcomeVC.user = user
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoginTF.layer.cornerRadius = 10
        PasswordTF.layer.cornerRadius = 10
        LogInButton.layer.cornerRadius = 10
    }
    
    
    
    
    @IBAction func LogInTap(_ sender: UIButton) {
        guard LoginTF.text == user.login,
              PasswordTF.text == user.password
        else {
            showAlert(title: "Invalid login or password",
                      message: "Please, enter correct login and password",
                      textField: PasswordTF)
            return
        }
        performSegue(withIdentifier: "LogIn", sender: nil)
        
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    
    @IBAction func forgotNameTap() {
        showAlert(title: "Oops!",
                  message: "Your name is \(user.login)")
    }
    
    
    @IBAction func forgotPasswordTap() {
        showAlert(title: "Oops!",
                  message: "Your password is \(user.password)")
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        LoginTF.text = nil
        PasswordTF.text = nil
    }
    
}



extension ViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == LoginTF {
            PasswordTF.becomeFirstResponder()
        } else {
            LogInTap(LogInButton)
        }
        return true
    }
}

