// Playground - noun: a place where people can play


var str = "Hello, playground"

// MARK: - Data Model

class AddressBook {
    var contacts = [Contact]()
    init() {
        
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

enum Menu {
    case NewContact, ListContacts, DeleteAll, Quit
    func printMenuOptions() -> String {
        switch self {
        case .NewContact:
            return "Create a New Contact"
        case .ListContacts:
            return "List all Contacts"
        case .DeleteAll:
            return "Delete Address Book"
        case .Quit:
            return "Quit application"
        }
    }
}


// MARK: Functions

func createNewContactWithName(name: String, #email: String, addressBook: AddressBook) {
    var newContact = Contact(name: name, email: email)
    addressBook.contacts.append(newContact)
}

func deleteAllContacts() {
    addressBook.contacts.removeAll(keepCapacity: false)
}


func userSelected(userSelection: Menu) {
    switch userSelection {
    case .DeleteAll:
        deleteAllContacts()
    case .NewContact:
        createNewContactWithName("NEW CONTACT", email: "EMAIL", addressBook)
        
        //    case .ListContacts:
    case .Quit:
        println("Good Bye!  Thanks for checking out my app")
    default:
        println("Error - This line should never be called")
    }
}




// MARK: Test User Options






let addressBook = AddressBook()

createNewContactWithName("Mike", email: "email@gmail.com", addressBook)
createNewContactWithName("Sonja", email: "", addressBook)
createNewContactWithName("Michelle", email: "michelle@gmail.com", addressBook)

addressBook.contacts.count

addressBook.contacts[1].name



// Task 1 - Delete All Contacts from Address Book



addressBook.contacts
