//
//  RequestProvider.swift
//  SafeSleepApp
//
//  Created by Caio Cesar on 17/09/24.
//

import Foundation
import PromiseKit

struct NetworkProvider {
    
    private init() { }
    
    static let shared = NetworkProvider()
    
    func request<T: Codable>(_ requestProvider: URLRequest, parseAs object: T.Type) -> Promise<T> {
        return Promise { seal in
            URLSession.shared.dataTask(with: requestProvider) { data, response, error in
                guard let data = data else { return seal.reject(NetworkError.emptyResponseDataError) }
                
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
                
                if 200...299 ~= statusCode {
                    do {
                        let parsedObj = try JSONDecoder().decode(T.self, from: data)
                        seal.fulfill(parsedObj)
                    } catch {
                        seal.reject(NetworkError.mappingError)
                    }
                    
                    
                }
                
                return seal.reject(self.parseErrorFor(statusCode: statusCode))
            }.resume()
        }
    }
    
    func request(_ requestProvider: URLRequest) -> Promise<Void> {
        return Promise { seal in
            URLSession.shared.dataTask(with: requestProvider) { data, response, error in
                guard let data = data else { return seal.reject(NetworkError.emptyResponseDataError) }
                
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
                
                if 200...299 ~= statusCode {
                    seal.fulfill_()
                }
                
                return seal.reject(self.parseErrorFor(statusCode: statusCode))
            }.resume()
        }
    }

    fileprivate func parseErrorFor(statusCode: Int) -> NetworkError {
        switch statusCode {
        case 401:
            return .unauthorized
        case 403:
            return .forbidden
        case 404:
            return .notFound
        default:
            return .unknownError
        }
    }
}

enum NetworkError: Error {
    case badUrl
    case unauthorized
    case forbidden
    case notFound
    case mappingError
    case emptyResponseDataError
    case unknownError
}
