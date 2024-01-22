//
//  APIClient.swift
//  MovieApp
//
//  Created by Admin on 21/01/24.
//

import Foundation
import Combine

struct APIClient {
    func handleRequest<T:Decodable>(urlRequest: URLRequest, type: T.Type) -> AnyPublisher<T?, Error>? {
       return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap({ result in
                let value = try? JSONDecoder().decode(T.self, from: result.data)
                if let value = value {                    
                    return value
                }
                return nil
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
