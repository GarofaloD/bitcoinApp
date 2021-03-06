//
//  CurrencySelectionViewController.swift
//  bitcoinApp
//
//  Created by Daniel Garofalo on 12/4/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.
//

import UIKit

class CurrencySelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK:- Properties
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Outlets

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GlobalCurrenciesDataService.instance.getCurrencies().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "currencyReusableCell") as? CurrencyCell{
            let currencyDisplayed = GlobalCurrenciesDataService.instance.getCurrencies()[indexPath.row]
            cell.updateRegularCurrencyView(regularCurrency: currencyDisplayed)
            return cell
        } else {
            return CurrencyCell()
        }
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }

}
