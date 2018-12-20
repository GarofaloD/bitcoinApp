//
//  CryptoCodeService.swift
//  bitcoinApp
//
//  Created by Daniel Garofalo on 12/13/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.
//

import Foundation

class CryptoCodeService {
    
    static let instance = CryptoCodeService()
    
    
    //Bitcoin (BTC), Bitcoin Cash (BCH), Litecoin (LTC), Ethereum (ETH)
    let cryptosToLoadOnPicker = ["Bitcoin", "Bitcoin Cash", "Ethereum"]
    
    func translateCryptoCode(condition: String) -> String {
        switch (condition) {
        case "Bitcoin" :
            return "BTC"
        case "Bitcoin Cash" :
            return "BCH"
        case "Ethereum" :
            return "ETH"
        default :
            return "dunno"
        }
    }
    
}
