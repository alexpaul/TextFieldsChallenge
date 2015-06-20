//
//  CashTextFieldDelegate.swift
//  TextFieldsChallenge
//
//  Created by Alex Paul on 6/20/15.
//  Copyright (c) 2015 Alex Paul. All rights reserved.
//

import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        // Remove $ if it exist in cash text field
        var modifiedString = (textField.text as NSString).stringByReplacingOccurrencesOfString("$", withString: " ")
        
        // Construct the text that will be changed
        var newText: NSString = modifiedString // convert String to NSString
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        var newTextDoubleValue: Double = 0.0
        
        if textField.text == "" { // first instance divide value by 100
            newTextDoubleValue = newText.doubleValue / 100
        }else{ // multiply by 10
            newTextDoubleValue = newText.doubleValue * 10
        }
        
        newText = "\(newTextDoubleValue)"
        
        textField.text = "$\(newText)" // e.g $12.34
        
        return false
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
   
}
