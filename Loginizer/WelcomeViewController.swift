//
//  File.swift
//  Loginizer
//
//  Created by Тимур Турлыкин on 10.05.2023.
//

import Foundation
import UIKit


class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        welcomeLabel.text = "Welcome, \(user.login)"
    }
    
}



