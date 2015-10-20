//
//  ViewController.swift
//  RomanNumeral-Swift
//
//  Created by Swagatika on 9/28/15.
//  Copyright (c) 2015 swagatika. All rights reserved.
//


//Test 


import UIKit

class ViewController: UIViewController, UISearchBarDelegate{

    @IBOutlet weak var searchNumeral: UISearchBar!
    
    @IBOutlet weak var resultLabel: UILabel!
    var romanNumeralDictionary = [String:Int]()
   
    override  func viewDidLoad() {
        super.viewDidLoad()
         romanNumeralDictionary = ["I":1, "V":5, "X":10, "L":50, "C":100, "D":500, "M":1000]
         resultLabel.hidden = true;
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: - UISearchBarDelegate
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        return true;
    }
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
       if searchNumeral.text == ""{
        resultLabel.hidden = true;
        searchNumeral.resignFirstResponder()
        }
    }
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        resultLabel.hidden = true;
        searchNumeral.text = ""
        searchNumeral.resignFirstResponder()
    }
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        if(searchNumeral.text != "" && isValidForRoman(searchNumeral.text)){
            resultLabel.text = "The decimal value for eneterd roman numeral is \(romanToDecimal(searchNumeral.text))"
            resultLabel.hidden = false
        }
        else{
            let alertController = UIAlertController(title: "Error", message: "Roman Numeral is not valid", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    
    // MARK: - isValidForRoman
    /**
    
    @method
    
    isValidForRoman
    
    @param romanNumeral text entered by the user
    
    @discussion This method will valiadate eneterd roman numeral.
    
    */
    
   internal func isValidForRoman(text: String) -> Bool{
        
        var romanRegex = "^(?=.)(?i)M*(D?C{0,3}|C[DM])(L?X{0,3}|X[LC])(V?I{0,3}|I[VX])$";
        let romanTest = NSPredicate (format: "SELF MATCHES %@", romanRegex)
        return romanTest .evaluateWithObject(text)
    
    }
    
    
    
    // MARK: -  romanToDecimal
    
    /**
    
    @func
    
    romanToDecimal
    
    @param romanNumeral text entered by the user
    
    @discussion This method will return equivalent decimal number for eneterd roman numeral.
    
    */

   internal func romanToDecimal(romanNumeral: String) -> Int{
        var previousValue:Int = 0;
        var currentValue:Int  = 0;
        var finalValue:Int = 0;
        for var i = count(romanNumeral) - 1; i>=0 ; i--
        {
            var getCharOfRomanString = Array(romanNumeral.uppercaseString)[i]
            var strValue:String = "\(getCharOfRomanString)"
            currentValue = romanNumeralDictionary[strValue]!
            
            if(currentValue < previousValue){
                finalValue-=currentValue;
            }
            else{
               finalValue+=currentValue;
            }
           
            previousValue = currentValue;
        }
        return finalValue;
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

