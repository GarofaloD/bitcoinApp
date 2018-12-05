//
//  RegularCurrencies.swift
//  bitcoinApp
//
//  Created by Daniel Garofalo on 12/4/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.
//

import Foundation

struct RegularCurrency {
    
    //properties
    private(set) public var regularCurrencyCode : String
    private(set) public var regularCurrencyName : String
    private(set) public var regularCurrencyRate : Double?
    
    init(code: String, name: String, rate: Double) {
        self.regularCurrencyCode = code
        self.regularCurrencyName = name
        self.regularCurrencyRate = rate
    }
}
