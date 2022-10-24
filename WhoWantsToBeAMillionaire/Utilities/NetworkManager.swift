//
//  NetworkManager.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Bedirhan Altun on 23.10.2022.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func downloadQuestions(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200
            else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.cannotDecodeRawData)))
                return
            }
            
            completion(.success(data))
            
            

        }
        dataTask.resume()
 
    }
}

