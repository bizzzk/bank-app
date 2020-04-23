//
//  BalanceResponce.swift
//  task
//
//  Created by Sergey Deryabin on 14.04.2020.
//  Copyright © 2020 Sergey Deryabin. All rights reserved.
//

import Foundation

struct BalanceResponse: Decodable {
    
    var creditValues: [CreditBalance]
    var contributionValues: [ContributionBalance]
    
}

struct CreditBalance: Decodable {
    
    var cashBalance: String
    var creditBalance: String
}

struct ContributionBalance: Decodable {
    
    var contributionInUSD: String
    var contributionInEUR: String
    var contributionInRUB: String
}
