//
//  File.swift
//  Loginizer
//
//  Created by Тимур Турлыкин on 10.05.2023.
//

import Foundation
import UIKit

public struct User {
    let login: String
    let password: String
    
    static func getUserData() -> User {
        User(
            login: "User",
            password: "Password"
        )
    }
}


