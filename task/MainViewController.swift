//
//  MainViewController.swift
//  task
//
//  Created by Sergey Deryabin on 06.04.2020.
//  Copyright © 2020 Sergey Deryabin. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    
    let networkDataFetcher = NetworkDataFetcher()
    var balanceResponse: [BalanceResponse?] = []
    var tableViewData = [cellData]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.blackTranslucent
        self.navigationController?.navigationBar.barTintColor = UIColor.orange
        navigationItem.title = "Главная"
        
        setupCellData()

    }

    
    // MARK: - Table view data source

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentIndexPath = indexPath.row - 1
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Title") as! CustomTitleCell
            cell.titleLabel?.text = tableViewData[indexPath.section].title
            cell.imageOfTitle?.image = UIImage(named:"arrow2")
            if tableViewData[indexPath.section].opened == true {
                cell.imageOfTitle?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
                cell.borderView.round(with: .top, radius: 10.0)
            } else {
                cell.borderView.round(with: .both, radius: 10.0)
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Product") as! CustomProductCell
            cell.productName?.text = tableViewData[indexPath.section].sectionData[currentIndexPath]
            cell.imageOfProduct?.image = UIImage(named: tableViewData[indexPath.section].image)
            cell.cashBalance?.text = tableViewData[indexPath.section].cashBalance[currentIndexPath]
            let lastRowInSection = tableViewData[indexPath.section].sectionData.count
            if  indexPath.row == lastRowInSection {
                cell.borderView.round(with: .bottom, radius: 10.0)
            }
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if tableViewData[indexPath.section].opened == true {
                tableViewData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            } else {
                tableViewData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }
        }
    }
    
}

extension MainViewController {
    
    func setupCellData() {
        let urlString = "https://next.json-generator.com/api/json/get/VJrb6Ut_O"
        
        networkDataFetcher.fetchData(urlString: urlString) { (balanceResponse) in
            guard let balanceResponse = balanceResponse else { return }
            self.balanceResponse = balanceResponse
            
            for value in balanceResponse  {
                
                var credit = [String]()
                var contribution = [String]()
                
                for value in value.creditValues {
                    credit.append(value.cashBalance)
                    credit.append(value.creditBalance)
                }
                
                for value in value.contributionValues {
                    contribution.append(value.contributionInRUB)
                    contribution.append(value.contributionInUSD)
                    contribution.append(value.contributionInEUR)
                }
                
                let titles = ["Кредиты", "Вклады"]
                let creditProduct = ["выплата заработной платы", "ПОТРЕБИТЕЛЬСКИЙ КРЕДИТ"]
                let contributionProduct = ["ВКЛАД ДО ВОСТРЕБОВАНИЯ", "ВКЛАД ДО ВОСТРЕБОВАНИЯ", "ВКЛАД ДО ВОСТРЕБОВАНИЯ"]
                
                self.tableViewData = [cellData(opened: false, title: titles[0], sectionData: creditProduct, image: "creditProduct", cashBalance: credit),
                                      cellData(opened: false, title: titles[1], sectionData: contributionProduct, image: "contributionProduct", cashBalance: contribution)]
            }
            
            self.tableView.reloadData()
        }
    }
    
}
