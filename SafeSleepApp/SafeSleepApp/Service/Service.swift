//
//  Service.swift
//  SafeSleepApp
//
//  Created by Caio Cesar on 06/09/24.
//

import Foundation

class Service {
    
    func save(user: User) {
        if let encoded = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encoded, forKey: user.email)
        }
    }
    
    func getUser(email: String) -> User? {
        if let data = UserDefaults.standard.data(forKey: email) {
               if let decoded = try? JSONDecoder().decode(User.self, from: data) {
                   return decoded
               }
            return nil
           }
        return nil
    }
}
