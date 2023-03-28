//
//  Contatos.swift
//  oRacha
//
//  Created by Student17 on 27/03/23.
//

import Foundation

struct Contato: Hashable, Identifiable{
    let id = UUID()
    let nome: String
    let fone: String
}

struct Escolher: Identifiable{
    let id = UUID()
    let titulo: String
    let contato: [Contato]
}

let emergencia: [Escolher] = [
    Escolher(titulo: "Se comunique", contato: [
        Contato(nome: "Ambulância", fone: "192"),
        Contato(nome: "Bombeiros", fone: "193"),
        Contato(nome: "Polícia", fone: "190")
    ]),
    Escolher(titulo: "Contatos de emergência", contato: [
        Contato(nome: "Mãe", fone: "00000000"),
        Contato(nome: "Pai", fone: "00000000"),
        Contato(nome: "Tio", fone: "00000000"),
        Contato(nome: "Irmão", fone: "00000000")
    ])
]
