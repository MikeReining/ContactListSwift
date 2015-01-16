//
//  ViewController.swift
//  ContactListSwift
//
//  Created by Michael Reining on 1/15/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var addressBook = AddressBook()
    
    @IBOutlet weak var createContactButton: UIButton!
    
    @IBOutlet weak var addContactButton: UIButton!
    @IBOutlet weak var enterEmailTextField: UITextField!
    @IBOutlet weak var enterNameTextField: UITextField!
    @IBOutlet weak var addContact: UIButton!

    @IBAction func createNewContact(sender: AnyObject) {
        enterEmailTextField.hidden = false
        enterNameTextField.hidden = false
        enterEmailTextField.text.removeAll(keepCapacity: true)
        enterNameTextField.text.removeAll(keepCapacity: true)
        addContact.hidden = false
        enterNameTextField.becomeFirstResponder()
    }
    
    
    @IBAction func addContactButton(sender: AnyObject) {
        var name = enterNameTextField.text
        var email = enterEmailTextField.text
        var newContact = Contact(name: name, email: email)
        addressBook.contacts.append(newContact)
        println("\(addressBook.contacts.count)")
        resignFirstResponder()
        addContact.hidden = true
        enterEmailTextField.hidden = true
        enterNameTextField.hidden = true
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enterNameTextField.delegate = self //set delegate to textfile
        enterEmailTextField.delegate = self
        addContact.hidden = true
        enterEmailTextField.hidden = true
        enterNameTextField.hidden = true
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(textField: UITextField!) -> Bool {   //delegate method
        enterNameTextField.resignFirstResponder()
        enterEmailTextField.becomeFirstResponder()
        return true
    }
    
//    // Dismiss View / keyboard when background is tapped.  View has to be part of UIControl and use Touch Down action
//    
//    @IBAction func backgroundTap(sender: UIControl) {
//        enterNameTextField.resignFirstResponder()
//        enterEmailTextField.resignFirstResponder()
//    }
    
    

}

