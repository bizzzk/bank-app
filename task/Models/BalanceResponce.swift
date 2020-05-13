//
//  BalanceResponce.swift
//  task
//
//  Created by Sergey Deryabin on 14.04.2020.
//  Copyright © 2020 Sergey Deryabin. All rights reserved.
//

import Foundation

struct BalanceResponse: Decodable {
    var credit: [CellInfo]
    var contribution: [CellInfo]
}

enum Currency: String {
    case RUB
    case USD
    case EUR
}

struct CellInfo: Decodable {
    var title: String?
    var amount: String?
    var currency: Currency?
    
    private enum CodingKeys: String, CodingKey {
        case title
        case amount
        case currency
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        amount = try container.decode(String.self, forKey: .amount)
        currency = Currency(rawValue: try container.decode(String.self, forKey: .currency))
    }

}
