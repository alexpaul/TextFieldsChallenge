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
    
    // Text Field Delegates
    let zipCodeTextFieldDelegate = ZipCodeTextFieldDelegate()
    let cashTextFieldDelegate = CashTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zipCodeTextField.delegate = zipCodeTextFieldDelegate
        cashTextField.delegate = cashTextFieldDelegate
        lockableTextField.delegate = self
    }
    
    @IBAction func lockableSwithToggled(sender: UISwitch) {
        // Dismiss the keyboard so lock will take effect
        lockableTextField.resignFirstResponder()
    }

    // MARK: UITextFieldDelegate Methods for the lockableTextField
    
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
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }

}

