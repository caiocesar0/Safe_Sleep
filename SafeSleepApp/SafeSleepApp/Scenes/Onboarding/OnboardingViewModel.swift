//
//  OnboardingViewModel.swift
//  SafeSleepApp
//
//  Created by Caio Cesar on 06/09/24.
//

import UIKit

class OnboardingViewModel {
    
    let service = Service()
    var viewController: OnboardingViewPresentation?

    func validateUser(name: String, document: String, email: String, password: String, confirmPassword: String) {
        
        if !name.isEmpty && !document.isEmpty && !email.isEmpty && !password.isEmpty && !confirmPassword.isEmpty {
            
            if password == confirmPassword {
                service.createLogin(model: User(id: nil, username: document, password: password, email: email, name: name))?.done({ _ in
                    self.viewController?.routeToSucess()
                    
                }).catch({ _ in
                    self.viewController?.presentAlert(title: "Todas as informações são obrigatórias", message: "Por favor informe novamente suas informações")
                })
                
            } else {
                viewController?.presentAlert(title: "Senhas divergentes", message: "Por favor informe duas senhas iguais")
            }
        } else {
            viewController?.presentAlert(title: "Todas as informações são obrigatórias", message: "Por favor informe novamente suas informações")
        }
            
    }
    
}
