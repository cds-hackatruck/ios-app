//
//  ContactRow.swift
//  oRacha
//
//  Created by Student11 on 29/03/23.
//

import SwiftUI
import Contacts

struct ContactInfo : Identifiable{
    var id = UUID()
    var firstName: String
    var lastName: String
    var phoneNumber: CNPhoneNumber?
}

class FetchContacts {
    
    func fetchingContacts() -> [ContactInfo]{
        var contacts = [ContactInfo]()
        let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
        let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
        do {
            try CNContactStore().enumerateContacts(with: request, usingBlock: { (contact, stopPointer) in
                contacts.append(ContactInfo(firstName: contact.givenName, lastName: contact.familyName, phoneNumber: contact.phoneNumbers.first?.value))
            })
        } catch let error {
            print("Failed", error)
        }
        contacts = contacts.sorted {
            $0.firstName < $1.firstName
        }
        return contacts
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ContactRow: View {
    var contact: ContactInfo
    var body: some View {
        Text("\(contact.firstName) \(contact.lastName)").foregroundColor(.primary)
    }
}

struct ContactRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactRow(contact: ContactInfo(firstName: "", lastName: ""))
    }
}
