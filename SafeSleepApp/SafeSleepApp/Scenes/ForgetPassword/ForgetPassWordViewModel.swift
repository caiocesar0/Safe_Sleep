//
//  ForgetPassWordViewModel.swift
//  SafeSleepApp
//
//  Created by Caio Cesar on 06/09/24.
//

import Foundation

class ForgetPasswordViewModel {
    
    let service = Service()
    var viewController: ForgotPasswordViewPresentation?
    
    func validateNewPassword(email: String, document: String, password: String, confirmPassword: String) {
        
        if password == confirmPassword {
            service.changePassword(model: User(id: nil, username: document, password: password, email: email, name: nil))?.done({ _ in
                self.viewController?.routeToSucess()
            })
            .catch({ _ in
                self.viewController?.presentAlert(title: "Informações invalidas", message: "revise as informações para realizar a troca de senha")
            })
        } else {
            viewController?.presentAlert(title: "Senhas divergentes", message: "Por favor informe duas senhas iguais")
        }
    }
    
}
