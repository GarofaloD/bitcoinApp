//
//  Constants.swift
//  bitcoinApp
//
//  Created by Daniel Garofalo on 11/29/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()


//URL CRYPTO CURRENCIES
let BASE_URL = "https://apiv2.bitcoinaverage.com"
let BITCOIN_GET_URL = "\(BASE_URL)/indices/global/ticker/BTCUSD"
let GLOBAL_CURRENCIES_URL = "\(BASE_URL)/constants/exchangerates/global"


//Coin Value
let LAST_VALUE = "last"
