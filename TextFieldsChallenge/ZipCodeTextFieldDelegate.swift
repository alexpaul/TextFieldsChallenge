//
//  ZipCodeTextFieldDelegate.swift
//  TextFieldsChallenge
//
//  Created by Alex Paul on 6/20/15.
//  Copyright (c) 2015 Alex Paul. All rights reserved.
//

import UIKit

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var lengthOfZipCode = (textField.text as NSString).length
        if lengthOfZipCode == 5{
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        // With the case where zip code length is 5
        return true
    }
    
}
