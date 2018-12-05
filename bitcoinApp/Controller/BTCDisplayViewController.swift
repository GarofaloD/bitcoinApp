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

    
    override func viewDidLoad() {
        super.viewDidLoad()

        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        
        loadPrice()
        loadGlobalCurrencies()
        
    }
    
    
    
    
    
    //MARK:- UIPIcker Stubs

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    
    
    //Other Functions
    func loadPrice(){
        BitcoinDataService.instance.getBitcoinPrice { (success) in
            if success {
                self.priceDisplay.text = "\(String(CryptoCurrency.instance.value))"
            }
        }
    }
    
    func loadGlobalCurrencies(){
        GlobalCurrenciesDataService.instance.getGlobalCurrencies { (success) in
            if success {
                
            }
        }
    }
    

}
