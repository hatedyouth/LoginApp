//
//  AboutViewController.swift
//  Loginizer
//
//  Created by Тимур Турлыкин on 12.05.2023.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet weak var userPhotoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    var user: User!
    @IBOutlet weak var surnameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(user.person.name) \(user.person.surname)"
        userPhotoImageView.layer.cornerRadius = 30
        nameLabel.text = "Имя:   \(user.person.name)"
        surnameLabel.text = "Фамилия:   \(user.person.surname)"
    }
    
}
