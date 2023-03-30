//
//  Contatos.swift
//  oRacha
//
//  Created by Student17 on 27/03/23.
//

import Foundation
import Contacts

struct Contato: Hashable, Identifiable{
    let id = UUID()
    let nome: String
    let fone: String
}

/*
struct Escolher: Identifiable{
    let id = UUID()
    let titulo: String
    let contato: [ContactInfo]
}

struct Ligar {
    static let emergencia: [Escolher] = [
        Escolher(titulo: "Se comunique", contato: [
            ContactInfo.init(firstName: "Ambulância", lastName: "", phoneNumber: "192"),
            ContactInfo.init(firstName: "Bombeiros", lastName: "", phoneNumber: "193"),
            ContactInfo.init(firstName: "Polícia", lastName: "", phoneNumber: "190")
        ]),
        Escolher(titulo: "Contatos de emergência", contato: addedContacts)
    ]
}
 */

