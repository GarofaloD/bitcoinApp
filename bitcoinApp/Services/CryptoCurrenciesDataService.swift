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

class CryptoCurrenciesDataService {
    
    
    
    //MARK:- Singleton
    static let instance = CryptoCurrenciesDataService()
    
    
    
    //MARK:- Properties
    let CC = "BTCUSD"
    let defaults = UserDefaults.standard
    var cryptoCurrency = ""
    var cryptosArray = [String]()
   // var cryptosToLoadOnPicker = ["BCHUSD", "ETHNZD", "BCHNZD", "ETHAUD", "BTCAUD", "BTCNZD", "BTCUSD", "ETHUSD", "BCHAUD"]

    
    
    //MARK:- User Defaults
    var currentValue : Double {
        get {
            return defaults.value(forKey: LAST_VALUE) as! Double
        }
        set {
            defaults.set(newValue, forKey: LAST_VALUE )
        }
    }
    
    var currentCryptoCurrency : String {
        get {
            return defaults.value(forKey: CRYPTO_DEFAULT) as! String
        }
        set {
            defaults.set(newValue, forKey: CRYPTO_DEFAULT)
        }
    }
    
    
    
    
    
    
    //MARK:- REST Calls
    func getCryptoCoinPrice(fullCryptoName: String, completion: @escaping CompletionHandler){
        
        let cryptoSymbol = CryptoCodeService.instance.translateCryptoCode(condition: fullCryptoName)
        let cryptoValueCall = "\(CRYPTO_VALUE_GET_URL)/\(cryptoSymbol)"
        
        Alamofire.request(cryptoValueCall, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in

            if response.result.error == nil {

                let cryptoDatafromJSON : JSON = JSON(response.result.value as Any)
                if let data = cryptoDatafromJSON["last"].double {
                    self.currentValue = data

                    CryptoCurrency.instance.setCurrency(currencyName: fullCryptoName, currencySymbol: cryptoSymbol, currencyValue: self.currentValue)

                }
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }

    
    
    
    
    func getCryptoCurrencies(completion: @escaping CompletionHandler) {
        
        var exchanges : JSON?
        
        Alamofire.request(GET_CRYPTO_CURRENCIES_URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in

            if response.result.error == nil {
                guard let cryptosFromJSON = response.data else {return}
                let json = try? JSON(data:cryptosFromJSON)

                exchanges = json!["exchanges"]["independentreserve"]["symbols"]
                
                for (_, value) in exchanges!{
                    //print(value)
                    self.cryptoCurrency = value.stringValue
                    self.cryptosArray.append(self.cryptoCurrency)
                }
                //print(self.cryptosArray)
                completion(true)
                
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    

    
    
}
