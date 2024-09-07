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
        
        guard let user = service.getUser(email: email) else {
            viewController?.presentAlert(title: "Usuário não encontrado", message: "informar um usuário valido")
            return
        }
        
        if user.document == document{
            if password == confirmPassword {
                service.save(user: User(name: user.name, document: user.document, email: user.email, password: password))
                
                viewController?.routeToSucess()
            } else {
                viewController?.presentAlert(title: "Senhas divergentes", message: "Por favor informe duas senhas iguais")
            }
        } else {
            viewController?.presentAlert(title: "Documento invalido", message: "Documento informado não encotrado")
        }
    }
}
