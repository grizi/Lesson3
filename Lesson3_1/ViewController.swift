//
//  ViewController.swift
//  Lesson3_1
//
//  Created by Stefan Voljc on 22/10/15.
//  Copyright © 2015 Stefan Voljc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
var convert = Converter()
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet var TextIn:UITextField!
    @IBAction func TextIn(sender: UITextField) {
        
    }
    @IBOutlet var EURIn:UIButton!
    @IBAction func EURIn(sender: UIButton) {
       inCurrency = EUR
        EURIn.backgroundColor = UIColor.greenColor()
        USDIn.backgroundColor = UIColor.whiteColor()
        HRKIn.backgroundColor = UIColor.whiteColor()
    }
    @IBOutlet var USDIn:UIButton!
    @IBAction func USDIn(sender: UIButton) {
       inCurrency = USD
        EURIn.backgroundColor = UIColor.whiteColor()
        USDIn.backgroundColor = UIColor.greenColor()
        HRKIn.backgroundColor = UIColor.whiteColor()
    }
    @IBOutlet var HRKIn:UIButton!
    @IBAction func HRKIn(sender: UIButton) {
        inCurrency = HRK
        EURIn.backgroundColor = UIColor.whiteColor()
        USDIn.backgroundColor = UIColor.whiteColor()
        HRKIn.backgroundColor = UIColor.greenColor()
    }
    @IBOutlet var EUROut:UIButton!
    @IBAction func EUROut(sender: UIButton) {
        outCurrency = EUR
        EUROut.backgroundColor = UIColor.greenColor()
        USDOut.backgroundColor = UIColor.whiteColor()
        HRKOut.backgroundColor = UIColor.whiteColor()
    }
    @IBOutlet var USDOut:UIButton!
    @IBAction func USDOut(sender: UIButton) {
        outCurrency = USD
        EUROut.backgroundColor = UIColor.whiteColor()
        USDOut.backgroundColor = UIColor.greenColor()
        HRKOut.backgroundColor = UIColor.whiteColor()
    }
    @IBOutlet var HRKOut:UIButton!
    @IBAction func HRKOut(sender: UIButton) {
        outCurrency = HRK
        EUROut.backgroundColor = UIColor.whiteColor()
        USDOut.backgroundColor = UIColor.whiteColor()
        HRKOut.backgroundColor = UIColor.greenColor()
    }
    @IBOutlet var Convert:UIButton!
    @IBAction func Convert(sender: UIButton) {
      //  self.label.text =
      var x =  convert.converter(Double ((self.TextIn.text! as NSString).doubleValue),startCurrency:inCurrency!,targetCurrency:outCurrency!)
        self.label.text = String(format: "%.3f", x.convertedValue)
    }
}

var inCurrency : Valuta?
var outCurrency : Valuta?

class Valuta
{
    var currency:String
    var value:Double
    
    init(currency:String, value:Double)
    {
        self.currency = currency
        self.value = value
    }
}

class Converter {
    func converter (value:Double  , startCurrency:Valuta , targetCurrency:Valuta) -> (convertedValue:Double, targetCurrencyr:Valuta)
    {
        let convertedValue = value * (startCurrency.value / targetCurrency.value)
        let targetCurrencyr = targetCurrency
        return (convertedValue, targetCurrencyr)
    }
}


let USD = Valuta(currency: "USD",value: 1.0)
let EUR = Valuta(currency: "EUR",value: 1.2)
let HRK = Valuta(currency: "HRK",value: 0.16)

