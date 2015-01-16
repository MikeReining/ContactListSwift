//
//  ViewController.swift
//  ContactListSwift
//
//  Created by Michael Reining on 1/15/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {   
    
    var addressBook = AddressBook()
    let kCellIdentifier: String = "ContactCell"

    
    @IBOutlet weak var addNewContactDetailsLabel: UILabel!
    @IBOutlet weak var whatWouldYouLikeLabel: UILabel!
    @IBOutlet weak var createContactButton: UIButton!

    @IBOutlet weak var enterEmailTextField: UITextField!
    @IBOutlet weak var enterNameTextField: UITextField!
    
    @IBOutlet weak var addContactButton: UIButton!
    @IBOutlet weak var addContact: UIButton!
    @IBOutlet weak var listAllContactsButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var contactListTableView: UITableView!

    
    @IBAction func createNewContact(sender: AnyObject) {
        enterEmailTextField.hidden = false
        enterNameTextField.hidden = false
        enterEmailTextField.text.removeAll(keepCapacity: true)
        enterNameTextField.text.removeAll(keepCapacity: true)
        addContact.hidden = false
        listAllContactsButton.hidden = true
        enterNameTextField.becomeFirstResponder()
        createContactButton.hidden = true
        addNewContactDetailsLabel.hidden = false
        
    }
    
    @IBAction func listAllContacts(sender: AnyObject) {
        createContactButton.hidden = true
        listAllContactsButton.hidden = true
        whatWouldYouLikeLabel.hidden = true
        contactListTableView.hidden = false
        backButton.hidden = false
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
        listAllContactsButton.hidden = false
        addNewContactDetailsLabel.hidden = true
        createContactButton.hidden = false
        enterEmailTextField.resignFirstResponder()
        enterNameTextField.resignFirstResponder()
        let message = "Name: \(name) Email: \(email)"
        let alert = UIAlertController(title: "New Contact Added", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)


    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        contactListTableView.hidden = true
        whatWouldYouLikeLabel.hidden = false
        createContactButton.hidden = false
        listAllContactsButton.hidden = false
        backButton.hidden = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enterNameTextField.delegate = self //set delegate to textfile
        enterEmailTextField.delegate = self
        addContact.hidden = true
        enterEmailTextField.hidden = true
        enterNameTextField.hidden = true
        addNewContactDetailsLabel.hidden = true
        contactListTableView.hidden = true
        createNewContactWithName("Mike", email: "email@gmail.com", addressBook: addressBook)
        createNewContactWithName("Sonja", email: "", addressBook: addressBook)
        createNewContactWithName("Michelle", email: "michelle@gmail.com", addressBook: addressBook)
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Contact List"
        backButton.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(textField: UITextField!) -> Bool {   //delegate method
        if textField == enterNameTextField {
            enterNameTextField.resignFirstResponder()
            enterEmailTextField.becomeFirstResponder()
            return true

        }
        
        if textField == enterEmailTextField {
            enterEmailTextField.resignFirstResponder()
            addContactButton(textField)
            return true
        }
        
        return false
    }
    
    func createNewContactWithName(name: String, email: String, addressBook: AddressBook) {
        var newContact = Contact(name: name, email: email)
        addressBook.contacts.append(newContact)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressBook.contacts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as UITableViewCell

        cell.textLabel?.text = addressBook.contacts[indexPath.row].name
        cell.detailTextLabel?.text = addressBook.contacts[indexPath.row].email
        return cell
    }
    
}



