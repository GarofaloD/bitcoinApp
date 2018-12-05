//
//  Bitcoin.swift
//  bitcoinApp
//
//  Created by Daniel Garofalo on 12/2/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.
//

import Foundation

class CryptoCurrency {
    
    static let instance = CryptoCurrency()
    
    //Properties
    var name : String = ""
    var code : String = ""
    var value : Double = 0.0
    
    func setCurrency(currencyName: String, currencySymbol: String, currencyValue: Double) {
        self.name = currencyName
        self.code = currencySymbol
        self.value = currencyValue
    }
    
}
