//
//  LoginViewModel.swift
//  Navigation1_3
//
//  Created by Вилфриэд Оди on 04.10.2022.
//

import Foundation

protocol LoginNavigation {
    func goToHome()
}

class LoginViewModel: LoginNavigation {
    
    var loginDelegate: LoginFactory?
    var loginPassword = Binding(value: "")
    var navigation: LoginNavigation?
    
    func goToHome() {
        
        let verification = self.loginDelegate?.makeLoginInspector().check(loginUser: Checker.shared.login, passwordUser: Checker.shared.password)
        
        
        navigation?.goToHome()
    }
}
