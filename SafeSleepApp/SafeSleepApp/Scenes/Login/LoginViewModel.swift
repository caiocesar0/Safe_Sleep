//
//  LoginViewModel.swift
//  SafeSleepApp
//
//  Created by Caio Cesar on 06/09/24.
//

import Foundation

class LoginViewModel {
    
    let service = Service()
    var viewController: LoginViewPresentation?
    var user: User?
    
    func validateLogin(username: String, password: String) {
        
        service.validateLogin(model: User(id: nil, username: username, password: password, email: nil, name: nil))?.done({ user in
            self.user = user
            self.viewController?.routeToSucess()

        }).catch({ _ in
            self.viewController?.presentAlert(title: "Usuário não encontrado", message: "informar um usuário valido")
        })
      
    }
}
