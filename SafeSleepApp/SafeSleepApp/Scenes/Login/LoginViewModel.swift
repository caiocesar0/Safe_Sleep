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
    
    func validateLogin(email: String, password: String) {
        guard let user = service.getUser(email: email) else {
            viewController?.presentAlert(title: "Usuário não encontrado", message: "informar um usuário valido")
            return
        }
        
        if user.password == password {
            viewController?.routeToSucess()
        } else {
            viewController?.presentAlert(title: "Dados invalidos", message: "informe novamente as informações")
        }
    }
}
