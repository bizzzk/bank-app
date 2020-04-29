//
//  NetworkServiceFetcher.swift
//  task
//
//  Created by Sergey Deryabin on 25.04.2020.
//  Copyright © 2020 Sergey Deryabin. All rights reserved.
//

import Foundation

class NetworkDataFetcher {
    
    let networkService = NetworkService()
    
    func fetchData(urlString: String, response: @escaping ([BalanceResponse]?) -> Void) {
        networkService.request(urlString: urlString) { (data, error) in
            guard let data = data else { return }
            do {
                let values = try JSONDecoder().decode([BalanceResponse].self, from: data)
                response(values)
            } catch let jsonError {
                print("Failed to decode JSON", jsonError)
                response(nil)
            }
        }
    }
}
