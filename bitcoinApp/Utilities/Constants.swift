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
let CRYPTO_VALUE_GET_URL = "\(BASE_URL)/indices/global/ticker"
let GLOBAL_CURRENCIES_URL = "\(BASE_URL)/constants/exchangerates/global"
let GET_CRYPTO_CURRENCIES_URL = "\(BASE_URL)/symbols/exchanges/ticker"


//Coin Value
let LAST_VALUE = "last"

//Crypto default
let CRYPTO_DEFAULT = "cryptoDefault"
