//
//  DataService.swift
//  bitcoinApp
//
//  Created by Daniel Garofalo on 11/29/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class BitcoinDataService {
    
    //MARK:- Singleton
    
    static let instance = BitcoinDataService()
    
    //MARK:- Properties
    let CC = "BTCUSD"
    let defaults = UserDefaults.standard
    
    var currentValue : Double {
        get {
            return defaults.value(forKey: LAST_VALUE) as! Double
        }
        set {
            defaults.set(newValue, forKey: LAST_VALUE )
        }
    }
    
    
    func getBitcoinPrice(completion: @escaping CompletionHandler){
        Alamofire.request(BITCOIN_GET_URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            if response.result.error == nil {
                
                let cryptoDatafromJSON : JSON = JSON(response.result.value as Any)
                if let data = cryptoDatafromJSON["last"].double {
                    self.currentValue = data
                    
                CryptoCurrency.instance.setCurrency(currencyName: "BitCoin", currencySymbol: self.CC, currencyValue: self.currentValue)
                    
                }
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    
    
    
    
    
    
}
