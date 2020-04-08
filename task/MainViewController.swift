//
//  MainViewController.swift
//  task
//
//  Created by Sergey Deryabin on 06.04.2020.
//  Copyright © 2020 Sergey Deryabin. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    let titles = ["Кредиты", "Вклады"]
    let creditProduct = ["Выплата заработной платы", "ПОТРЕБИТЕЛЬСКИЙ КРЕДИТ"]
    let contributionProduct = ["ВКЛАД ДО ВОСТРЕБОВАНИЯ", "ВКЛАД ДО ВОСТРЕБОВАНИЯ", "ВКЛАД ДО ВОСТРЕБОВАНИЯ"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barStyle = UIBarStyle.blackTranslucent
        self.navigationController?.navigationBar.barTintColor  = UIColor.orange
        navigationItem.title = "Главная"

    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Title", for: indexPath)
        if indexPath.row == 0 {
            print(cell.frame.width-cell.frame.width-15.0)
            return Int(cell.frame.width-cell.frame.width-15.0)
        }
        else{
            return 1
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return 3
        case 1:
            return 4
        default:
            return 0
        }
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Title", for: indexPath)
                cell.textLabel?.text = titles[0]
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Product", for: indexPath)
                cell.textLabel?.text = creditProduct[0]
                cell.imageView?.image = UIImage(named: "creditProduct")
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Product", for: indexPath)
                cell.textLabel?.text = creditProduct[1]
                cell.imageView?.image = UIImage(named: "creditProduct")
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
                return cell
            }
        case 1:
            switch (indexPath.row) {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Title", for: indexPath)
                cell.textLabel?.text = titles[1]
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Product", for: indexPath)
                cell.textLabel?.text = contributionProduct[0]
                cell.imageView?.image = UIImage(named: "contributionProduct")
                cell.detailTextLabel?.text = "Бессрочный"
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Product", for: indexPath)
                cell.textLabel?.text = contributionProduct[1]
                cell.imageView?.image = UIImage(named: "contributionProduct")
                cell.detailTextLabel?.text = "Бессрочный"
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Product", for: indexPath)
                cell.textLabel?.text = contributionProduct[2]
                cell.imageView?.image = UIImage(named: "contributionProduct")
                cell.detailTextLabel?.text = "Бессрочный"
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
                return cell
            }
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
            return cell
        }
    }
    
}

