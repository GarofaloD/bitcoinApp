//
//  CurrencyCell.swift
//  bitcoinApp
//
//  Created by Daniel Garofalo on 12/4/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.
//

import UIKit

class CurrencyCell: UITableViewCell {

    @IBOutlet weak var regularCurrencyTitle : UILabel!
    
    func updateRegularCurrencyView(regularCurrency: RegularCurrency){
        regularCurrencyTitle.text = regularCurrency.regularCurrencyName
    }

}
