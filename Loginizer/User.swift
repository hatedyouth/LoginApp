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
    let person: Person
    
    static func getUserData() -> User {
        User(
            login: "User",
            password: "Password",
            person: Person(name: "Bill", surname: "Gates", bio: biography)
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let bio: String
}


let biography = "William Henry Gates III (born October 28, 1955) is an American business magnate, investor, and philanthropist. He is best known for co-founding software giant Microsoft, along with his late childhood friend Paul Allen. During his career at Microsoft, Gates held the positions of chairman, chief executive officer (CEO), president and chief software architect, while also being its largest individual shareholder until May 2014.[4] He was a major entrepreneur of the microcomputer revolution of the 1970s and 1980s."
