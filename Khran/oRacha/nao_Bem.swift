////
////  nao_Bem.swift
////  oRacha
////
////  Created by Student17 on 13/03/23.
////
//
//import SwiftUI
//
//struct Contatos: Hashable, Identifiable{
//    let id = UUID()
//    let nome: String
//    let fone: String
//}
//
//struct Escolher: Identifiable{
//    let id = UUID()
//    let titulo: String
//    let contato: [Contatos]
//}
//
//let emergencia: [Escolher] = [
//    Escolher(titulo: "Se comunique", contato: [
//        Contatos(nome: "Ambulância", fone: "192"),
//        Contatos(nome: "Bombeiros", fone: "193"),
//        Contatos(nome: "Polícia", fone: "190")
//    ]),
//    Escolher(titulo: "Contatos de emergência", contato: [
//        Contatos(nome: "Mãe", fone: "00000000"),
//        Contatos(nome: "Pai", fone: "00000000"),
//        Contatos(nome: "Tio", fone: "00000000"),
//        Contatos(nome: "Irmão", fone: "00000000")
//    ])
//]
//
//struct ContentView: View {
//    var body: some View {
//        NavigationStack{
//            List{
//                ForEach(emergencia){emergencia in
//                    Section(header: Text("\(emergencia.titulo)")){
//                        ForEach(emergencia.contato){contato in
//                            VStack{
//                                Text("\(contato.nome)")
//                            }//Vstack
//                        }//ForEach
//                    }//Section
//                }//ForEach
//            }//List
//            .navigationTitle("Emergência acionada")
//        }//Navigationstack
//    }//body
//}//struct
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
////adicionar navigationlink
