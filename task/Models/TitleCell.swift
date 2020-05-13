//
//  CustomTitleCell.swift
//  task
//
//  Created by Sergey Deryabin on 23.04.2020.
//  Copyright © 2020 Sergey Deryabin. All rights reserved.
//

import UIKit

final class TitleCell: UITableViewCell {
    
    private let titles = ["Кредиты", "Вклады"]

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageOfTitle: UIImageView!
    @IBOutlet private weak var borderView: UIView!
    
    func bind(indexPath: IndexPath) {
        self.titleLabel?.text = titles[indexPath.section]
        self.imageOfTitle?.image = UIImage(named:"arrow2")
    }
    
    func borderSectionSetup(object: CellData) {
        if object.isOpened == true {
            self.imageOfTitle?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
            self.borderView.round(with: .top, radius: 10.0)
        } else {
            self.imageOfTitle?.transform = CGAffineTransform(rotationAngle: 0)
            self.borderView.round(with: .both, radius: 10.0)
        }
    }
    
}
