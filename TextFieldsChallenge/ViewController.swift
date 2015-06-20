//
//  ViewController.swift
//  TextFieldsChallenge
//
//  Created by Alex Paul on 6/19/15.
//  Copyright (c) 2015 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // IBOutlets 
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    @IBOutlet weak var lockableTextField: UITextField!
    @IBOutlet weak var lockableSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zipCodeTextField.delegate = self
        cashTextField.delegate = self
        lockableTextField.delegate = self
    }
    
    @IBAction func lockableSwithToggled(sender: UISwitch) {
        // Dismiss the keyboard so lock will take effect
        lockableTextField.resignFirstResponder()
    }

    // MARK: UITextFieldDelegate Methods
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        var dismissKeyboard = true
        
        if textField == lockableTextField {
            dismissKeyboard = (lockableSwitch.on) ? true : false
            return dismissKeyboard
        }
        return dismissKeyboard
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var lengthOfZipCode = (zipCodeTextField.text as NSString).length
        if lengthOfZipCode == 5{
            zipCodeTextField.resignFirstResponder()
        }
        
        if textField == cashTextField {
            // Remove $ if it exist in cash text field
            var modifiedString = (cashTextField.text as NSString).stringByReplacingOccurrencesOfString("$", withString: " ")
            
            // Construct the text that will be changed
            var newText: NSString = modifiedString // convert String to NSString
            newText = newText.stringByReplacingCharactersInRange(range, withString: string)
            
            var newTextDoubleValue: Double = 0.0
            
            if cashTextField.text == "" { // first instance divide value by 100
                newTextDoubleValue = newText.doubleValue / 100
            }else{ // multiply by 10
                newTextDoubleValue = newText.doubleValue * 10
            }
        
            newText = "\(newTextDoubleValue)"
            
            cashTextField.text = "$\(newText)" // e.g $12.34
            
            return false
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

