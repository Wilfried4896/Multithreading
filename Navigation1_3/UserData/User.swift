//
//  User.swift
//  Navigation1_3
//
//  Created by Вилфриэд Оди on 20.09.2022.
//

import UIKit

protocol UserService {
    func loginIn(login: String) -> User?
}

class User {
    
    var login: String
    var fullName: String
    var avatar: UIImage?
    var status: String
    
    init(login: String, fullName: String, avatar: UIImage? = nil, status: String) {
        self.login = login
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}

class CurrentUserService: UserService {
    let userCurrent: User
    
    init(userCurrent: User) {
        self.userCurrent = userCurrent
    }
    
    func loginIn(login: String) -> User? {
        
        guard login == userCurrent.login else {
            print("Неправильно логин или пароль")
            return nil }
        return userCurrent
    }
}

class TestUserService: UserService {
    let userTest: User
    
    init(userTest: User) {
        self.userTest = userTest
    }
    
    func loginIn(login: String) -> User? {
        guard login == userTest.login else { return nil }
        
        return userTest
    }
}


protocol LoginViewControllerDelegate {
    func check(loginUser: String, passwordUser: String) -> Bool
}

// фабрика
protocol LoginFactory {
    func makeLoginInspector() -> LoginInspector
}

struct MyLoginFactory: LoginFactory {
    let loginInspector: LoginInspector
    
    func makeLoginInspector() -> LoginInspector {
        return loginInspector
    }
}

struct LoginInspector: LoginViewControllerDelegate {
    
    func check(loginUser: String, passwordUser: String) -> Bool {
        Checker.shared.check(loginUser: loginUser, passwordUser: passwordUser)
    }
}


class Checker: LoginViewControllerDelegate {
    
    static let shared = Checker()
    
    private init() {}
    
    private var login: String = "login"
    private var password: String = "password"
    
    func check(loginUser: String, passwordUser: String) -> Bool {
        
        var correctLoginPassword = loginUser == login && passwordUser == password
        print(correctLoginPassword)
        return correctLoginPassword
    }
}
