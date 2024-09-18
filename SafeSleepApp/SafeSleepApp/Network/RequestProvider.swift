//
//  RequestProviderProtocol.swift
//  SafeSleepApp
//
//  Created by Caio Cesar on 17/09/24.
//

import Foundation


class RequestProvider {
    
    var user: User?
    
    var validateLogin: URLRequest? {
        guard let urlPath = URL(string: "http://localhost:8080/login") else {
            return nil
        }
        
        var url = URLRequest(url: urlPath)
        url.httpMethod = "GET"
        
        let data: [String: Any] = [
            "username": user?.username ?? "",
            "password": user?.password ?? "",
        ]
        
        do {
            url.httpBody = try JSONEncoder().encode(user)
        } catch {
            return nil
        }
        return url
    }
    
    var createLogin: URLRequest? {
        guard let urlPath = URL(string: "http://localhost:8080/login") else {
            return nil
        }
        var url = URLRequest(url: urlPath)
        url.httpMethod = "POST"
        
        let data: [String: Any] = [
            "username": user?.username ?? "",
            "password": user?.password ?? "",
            "email": user?.email ?? "",
            "name": user?.name ?? ""
        ]
        
        do {
            url.httpBody = try JSONEncoder().encode(user)
        } catch {
            return nil
        }
        
        return url
    }
    
    var changePassword: URLRequest? {
        guard let urlPath = URL(string: "http://localhost:8080/login") else {
            return nil
        }
        var url = URLRequest(url: urlPath)
        url.httpMethod = "PUT"
        
        let data: [String: Any] = [
            "username": user?.username ?? "",
            "password": user?.password ?? "",
            "email": user?.email ?? "",
        ]
        
        do {
            url.httpBody = try JSONEncoder().encode(user)
        } catch {
            return nil
        }
        return url
    }
    
}
