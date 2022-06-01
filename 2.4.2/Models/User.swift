//
//  User.swift
//  2.4.2
//
//  Created by Александр on 29.04.2022.
//

struct User {
    var logIn: String
    let password: String
    let person: Person

    static func getUserData() -> User {
        User(logIn: "User",
             password: "Password",
             person: Person.getPerson())
    }
}

struct Person {
    let name: String
    let surname: String
    let myPhoto: String
    let books: [String]
    
    var fullName: String {
        "\(name) \(surname)"
    }
    static func getPerson() -> Person {
        Person(name: "Alexandr",
               surname: "Ivantsov",
               myPhoto: "рыбалка2",
               books: ["атлант", "три мушкетера"]
        )
    }
}
