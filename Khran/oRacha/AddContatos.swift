//
//  AddContatos.swift
//  oRacha
//
//  Created by Student11 on 29/03/23.
//

import SwiftUI
import Contacts

struct Escolher: Identifiable{
    var id = UUID()
    var titulo: String
    var contato: [ContactInfo]
}

// Agora falta aqui dar um jeito de salvar os contatos salvos de forma global
// para que, quando for para a tela de contatos para ligar, conseguir ligar

struct Ligar {
    static var emergencia: [Escolher] = [
        Escolher(titulo: "Se comunique", contato: [
            ContactInfo.init(firstName: "Ambulância", lastName: "", phoneNumber: CNPhoneNumber(stringValue: "192")),
            ContactInfo.init(firstName: "Bombeiros", lastName: "", phoneNumber: CNPhoneNumber(stringValue: "192")),
            ContactInfo.init(firstName: "Polícia", lastName: "", phoneNumber: CNPhoneNumber(stringValue: "192"))
        ]),
        Escolher(titulo: "Se comunique", contato: [])
    ]
}

struct AddContatos: View {
    @State private var contacts = [ContactInfo.init(firstName: "", lastName: "", phoneNumber: nil)]
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    @State private var addedContacts: [ContactInfo] = []
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                   //search bar magnifying glass image
                   Image(systemName: "magnifyingglass").foregroundColor(.secondary)
                            
                   //search bar text field
                   TextField("search", text: self.$searchText, onEditingChanged: { isEditing in
                   self.showCancelButton = true
                   })
                   
                   // x Button
                   Button(action: {
                       self.searchText = ""
                   }) {
                       Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.secondary)
                              .opacity(self.searchText == "" ? 0 : 1)
                      }
                }
                .padding(8)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
                            
                  // Cancel Button
                  if self.showCancelButton  {
                      Button("Cancel") {
                         UIApplication.shared.endEditing(true)
                         self.searchText = ""
                         self.showCancelButton = false
                   }
                 }
               }
                .padding([.leading, .trailing,.top])
            
            List {
                ForEach (self.contacts.filter({ (cont) -> Bool in
                    self.searchText.isEmpty ? true :
                        "\(cont)".lowercased().contains(self.searchText.lowercased())
                })) { contact in
                    HStack {
                        ContactRow(contact: contact)
                        Spacer()
                        if !addedContacts.contains(where: { $0.id == contact.id }) {
                            Button(action: {
                                Ligar.emergencia[1].contato.append(contact)
                            }) {
                                Image(systemName: "plus")
                            }
                        }
                    }
                    .onTapGesture {
                        if !addedContacts.contains(where: { $0.id == contact.id }) {
                            addedContacts.append(contact)
                        }
                    }
                }
            }
            .onAppear() {
                self.requestAccess()
            }

            
            Spacer()
            
            List {
                ForEach(addedContacts, id: \.id) { contato in
                    Text("\(contato.firstName) \(contato.lastName)")
                }
            }
        }
    }
    
    func getContacts() {
        DispatchQueue.main.async {
            self.contacts = FetchContacts().fetchingContacts()
        }
    }
    
    func requestAccess() {
        let store = CNContactStore()
        switch CNContactStore.authorizationStatus(for: .contacts) {
        case .authorized:
            self.getContacts()
        case .denied:
            store.requestAccess(for: .contacts) { granted, error in
                if granted {
                    self.getContacts()
                }
            }
        case .restricted, .notDetermined:
            store.requestAccess(for: .contacts) { granted, error in
                if granted {
                    self.getContacts()
                }
            }
        @unknown default:
            print("error")
        }
    }
}

struct AddContatos_Previews: PreviewProvider {
    static var previews: some View {
        AddContatos()
    }
}
