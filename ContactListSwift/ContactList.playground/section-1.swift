// Playground - noun: a place where people can play


var str = "Hello, playground"

class AddressBook {
    var contacts = [Contact]()
    init() {
        
    }
    
    func createNewContactWithName(name: String, email: String) -> Contact {
        var newContact = Contact(name: name, email: email)
        self.contacts.append(newContact)
        return newContact
    }
}

class Contact {
    var name: String
    var email: String
    init (name: String, email: String) {
        self.name = name
        self.email = email
    }
}


let addressBook = AddressBook()

addressBook.createNewContactWithName("Mike", email: "email@gmail.com")

addressBook.contacts.count


