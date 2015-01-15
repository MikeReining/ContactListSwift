//
//  Contact.swift
//  ContactListSwift
//
//  Created by Michael Reining on 1/15/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import Foundation

class Contact {
    var name: String
    var email: String
    var contacts: [Contact]?
    init (name: String, email: String) {
        self.name = name
        self.email = email
        contacts?.append(self)
    }
}
