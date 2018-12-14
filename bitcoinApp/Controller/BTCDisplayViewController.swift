//
//  BTCDisplayViewController.swift
//  bitcoinApp
//
//  Created by Daniel Garofalo on 11/29/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.
//

import UIKit

class BTCDisplayViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    

    //MARK:- Outlets
    @IBOutlet weak var priceDisplay: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    
    //MARK:- Properties
    var currentCryptoOnPicker = "Bitcoin"
    //Bitcoin (BTC), Bitcoin Cash (BCH), Litecoin (LTC), Ethereum (ETH)
    
    
    
    
    //MARK:- Load up functions
    override func viewDidLoad() {
        super.viewDidLoad()


        loadGlobalCurrencies()
        loadPrice()
        
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
    }
    
    

    
    
    
    
    //MARK:- UIPIcker Stubs
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  CryptoCodeService.instance.cryptosToLoadOnPicker[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CryptoCodeService.instance.cryptosToLoadOnPicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentCryptoOnPicker = CryptoCodeService.instance.cryptosToLoadOnPicker[row]
        
        loadPrice()
        
        
        
        
        
        
        
        
        print(currentCryptoOnPicker)
    }
    
    
    
    
    //MARK:- Other Functions
    func loadPrice(){
        CryptoCurrenciesDataService.instance.getCryptoCoinPrice(fullCryptoName: currentCryptoOnPicker) { (success) in
            if success {
                self.priceDisplay.text = "\(String(CryptoCurrency.instance.value))"
            }
        }
    }
    
    func loadGlobalCurrencies(){
        GlobalCurrenciesDataService.instance.getGlobalCurrencies { (success) in
            if success {
                // print("Regular currencies loaded")
            }
        }
    }
    
    func loadCryptos(){
        CryptoCurrenciesDataService.instance.getCryptoCurrencies { (success) in
            if success {
                //print(CryptoCurrenciesDataService.instance.cryptosArray)
            }
        }
    }
    
    

    

}
