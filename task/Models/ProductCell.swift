//
//  CustomProductCell.swift
//  task
//
//  Created by Sergey Deryabin on 11.04.2020.
//  Copyright © 2020 Sergey Deryabin. All rights reserved.
//

import UIKit

final class ProductCell: UITableViewCell {
    
    @IBOutlet private weak var imageOfProduct: UIImageView!
    @IBOutlet private weak var productName: UILabel!
    @IBOutlet private weak var cashBalance: UILabel!
    @IBOutlet private weak var borderView: UIView!
    
     func bind(object: CellData, indexPath: IndexPath) {
        let currentIndexPath = indexPath.row - 1
        let model = object.cellInfo[currentIndexPath]
        self.productName?.text = model.title
        self.imageOfProduct?.image = UIImage(named: object.image)
        var cashBalance = model.amount
        if let currency = model.currency {
            switch currency {
            case .RUB:
                cashBalance? += " ₽"
            case .USD:
                cashBalance? += " $"
            case .EUR:
                cashBalance? += " €"
            }
        }
        self.cashBalance?.text = cashBalance
    }
    
    func borderSectionSetup(object: CellData, indexPath: IndexPath) {
        let lastRowInSection = object.cellInfo.count
        
        if  indexPath.row == lastRowInSection {
            self.borderView.round(with: .bottom, radius: 10.0)
        } else {
            self.borderView.round(with: .none, radius: 0)
        }
    }
    
}
