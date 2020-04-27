//
//  NetworkService.swift
//  task
//
//  Created by Sergey Deryabin on 19.04.2020.
//  Copyright © 2020 Sergey Deryabin. All rights reserved.
//

import Foundation

class NetworkService {
    
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    completion(nil, error)
                    return
                }
                guard let data = data else { return }
                completion(data, nil)
            }
        }.resume()
    }
}
