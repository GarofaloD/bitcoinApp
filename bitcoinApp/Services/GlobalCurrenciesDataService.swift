//
//  RegularCurrenciesDataService.swift
//  bitcoinApp
//
//  Created by Daniel Garofalo on 12/4/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class GlobalCurrenciesDataService {
    
    static let instance = GlobalCurrenciesDataService()
    
    
    var currCode = ""
    var currName = ""
    var currRate = 0.0
    
    var currencies = [RegularCurrency]()
    
    func getGlobalCurrencies(completion: @escaping CompletionHandler){
        Alamofire.request(GLOBAL_CURRENCIES_URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            if response.result.error == nil {
//                let globalCurrencyDataFromJson : JSON = JSON(response.result.value as Any)
//
//                if let currencyRates = try? globalCurrencyDataFromJson["rates"]{
//                    let currencyCode = currencyRates["rates"][0]
//                }

                guard let globalCurrencyDataFromJson = response.data else {return}
                let json = try? JSON(data:globalCurrencyDataFromJson)
                
                for (_,subJson):(String, JSON) in json!{
                    for(secondKey,secondSubJSON) in subJson {
                        let code = secondKey
                        let name = secondSubJSON["name"].stringValue
                        let rate = secondSubJSON["rate"].doubleValue
                        
                        self.currCode = code
                        self.currName = name
                        self.currRate = rate
                    
                        let currency = RegularCurrency(code: self.currCode, name: self.currName, rate: self.currRate)
                        self.currencies.append(currency)
                    }
                }
                
                print()
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    
    
    func getCurrencies() -> [RegularCurrency]{
        return currencies
    }
    
    
    
}
