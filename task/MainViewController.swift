//
//  MainViewController.swift
//  task
//
//  Created by Sergey Deryabin on 06.04.2020.
//  Copyright © 2020 Sergey Deryabin. All rights reserved.
//

import UIKit

final class MainViewController: UITableViewController {
    
    private let networkDataFetcher = NetworkDataFetcher()
    private var balanceResponse: BalanceResponse?
    private var tableViewData = [CellData]()
    
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
        if tableViewData[section].isOpened {
            return tableViewData[section].cellInfo.count + 1
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = tableViewData[indexPath.section]
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Title") as! TitleCell
            cell.bind(indexPath: indexPath)
            cell.borderSectionSetup(object: section)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Product") as! ProductCell
            cell.bind(object: section, indexPath: indexPath)
            cell.borderSectionSetup(object: section, indexPath: indexPath)
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        tableViewData[section].isOpened = !tableViewData[section].isOpened
        
        let sections = IndexSet.init(integer: section)
        tableView.reloadSections(sections, with: .none)
    }
    
}

extension MainViewController {
    
    private func setupCellData() {
        let urlString = "https://next.json-generator.com/api/json/get/EJSdpaN5_"
        
        networkDataFetcher.fetchData(urlString: urlString) { (balanceResponse) in
            guard let balanceResponse = balanceResponse else { return }
            self.balanceResponse = balanceResponse

            self.tableViewData = [CellData(cellInfo: balanceResponse.credit,
                                           isOpened: false,
                                           image: "creditProduct"),
                                  CellData(cellInfo: balanceResponse.contribution,
                                           isOpened: false,
                                           image: "contributionProduct")]
            
            self.tableView.reloadData()
        }
    }
    
}
