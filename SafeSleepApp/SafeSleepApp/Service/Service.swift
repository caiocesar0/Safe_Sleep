//
//  Service.swift
//  SafeSleepApp
//
//  Created by Caio Cesar on 06/09/24.
//

import Foundation
import PromiseKit

class Service {
    
    func validateLogin(model: User) -> Promise<User>? {
        var provider = RequestProvider()
        provider.user = model
        
        guard let login = provider.validateLogin else {
            return nil
        }
        
        return NetworkProvider.shared.request(login, parseAs: User.self)
    }
    
    func createLogin(model: User) -> Promise<Void>? {
        var provider = RequestProvider()
        provider.user = model
        
        guard let create = provider.createLogin else {
            return nil
        }
        
        return NetworkProvider.shared.request(create)
    }
    
    func changePassword(model: User) -> Promise<Void>? {
        var provider = RequestProvider()
        provider.user = model
        
        guard let change = provider.changePassword else {
            return nil
        }
        
        return NetworkProvider.shared.request(change)
    }
    
}

