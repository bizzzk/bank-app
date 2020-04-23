//
//  NetworkService.swift
//  task
//
//  Created by Sergey Deryabin on 19.04.2020.
//  Copyright © 2020 Sergey Deryabin. All rights reserved.
//

import Foundation

class NetworkService {
    
    func request(urlString: String, completion: @escaping ([BalanceResponse]?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    completion(nil, error)
                    return
                }
                guard let data = data else { return }
                do {
                    let values = try JSONDecoder().decode([BalanceResponse].self, from: data)
                    completion(values, nil)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    completion(nil, jsonError)
                }
            }
        }.resume()
    }
}
