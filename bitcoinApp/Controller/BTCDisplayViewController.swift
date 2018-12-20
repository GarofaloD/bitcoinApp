//
//  BTCDisplayViewController.swift
//  bitcoinApp
//
//  Created by Daniel Garofalo on 11/29/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.
//

import UIKit

class BTCDisplayViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, ChangeGlobalCurrency{

    

    //MARK:- Outlets
    @IBOutlet weak var priceDisplay: UILabel!
    @IBOutlet weak var currencyNameDisplay: UILabel!
    @IBOutlet weak var codeDisplay: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    
    
    //MARK:- Properties
    var currentCryptoOnPicker = "Bitcoin"
    var globalCurrencyToBePassed = "USD"
    //var updatedCode = ""
    var updatedCurrencyName = "United States Dollar"
    
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
        CryptoCurrenciesDataService.instance.getCryptoCoinPrice(fullCryptoName: currentCryptoOnPicker, globalCurrencyCode: globalCurrencyToBePassed) { (success) in
            if success {
                self.updateView(currencyCode: self.globalCurrencyToBePassed, currencyName: self.updatedCurrencyName)
            } else {
                self.priceDisplay.text = "Fuck!"
            }
        }
    }
    
    
    
    func loadGlobalCurrencies(){
        GlobalCurrenciesDataService.instance.getGlobalCurrencies { (success) in
            if success {
                //print("Regular currencies loaded")
            }
        }
    }
    
    func selectedGlobalCurrency(code: String, name: String){
        globalCurrencyToBePassed = code
        updatedCurrencyName = name
        CryptoCurrenciesDataService.instance.getCryptoCoinPrice(fullCryptoName: currentCryptoOnPicker, globalCurrencyCode: globalCurrencyToBePassed) { (success) in
            if success {
                self.updateView(currencyCode: code, currencyName: name)
            } else {
                self.priceDisplay.text = "??"
            }
        }
        
    }
    
    
//    func updateView(){
//
//        let currencyFormatter = NumberFormatter()
////        currencyFormatter.decimalSeparator = ","
//        //currencyFormatter.maximumFractionDigits = 2
//        currencyFormatter.numberStyle = .decimal
//
//        //let stringValue = String(CryptoCurrency.instance.value)
//        if let valueToDisplay = currencyFormatter.string(from: CryptoCurrency.instance.value as NSNumber) {
//            self.priceDisplay.text = "\(valueToDisplay)"
//        }
//
//        self.currencyNameDisplay.text = "\(GlobalCurrenciesDataService.instance.currName)"
//        self.codeDisplay.text = "\(GlobalCurrenciesDataService.instance.currCode)"
//
//        print(GlobalCurrenciesDataService.instance.currCode)
//
//    }
    
    func updateView(currencyCode: String, currencyName: String){
        
        let currencyFormatter = NumberFormatter()
       // currencyFormatter.decimalSeparator = ","
        currencyFormatter.maximumFractionDigits = 2
        currencyFormatter.minimumFractionDigits = 2
        currencyFormatter.numberStyle = .decimal
        
        
        //let stringValue = String(CryptoCurrency.instance.value)
        if let valueToDisplay = currencyFormatter.string(from: CryptoCurrency.instance.value as NSNumber) {
            self.priceDisplay.text = "\(valueToDisplay)"
        }
        
        self.currencyNameDisplay.text = "\(currencyName)"
        self.codeDisplay.text = "(\(currencyCode))"
        
        //print(currencyCode)
        
    }
    
    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToCurrencySelection" {
            let destinationVC = segue.destination as! CurrencySelectionViewController
            destinationVC.delegate = self
            
        }
    }
    

    
    

}
