////
////  ContentView.swift
////  oRacha
////
////  Created by Student17 on 13/03/23.
////
//
//import SwiftUI
//
////struct Contatos: Hashable, Identifiable{
////    let id = UUID()
////    let nome: String
////    let fone: String
////}
////
////struct Escolher: Identifiable{
////    let id = UUID()
////    let titulo: String
////    let contato: [Contatos]
////}
////
////let emergencia: [Escolher] = [
////    Escolher(titulo: "Se comunique", contato: [
////        Contatos(nome: "Ambulância", fone: "192"),
////        Contatos(nome: "Bombeiros", fone: "193"),
////        Contatos(nome: "Polícia", fone: "190")
////    ])
////]
//
//struct ContentView: View {
//    @State private var progress = 1.0
//    @State private var count = 60
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//
//    var body: some View{
//        ZStack{
//            VStack{
//                HStack{
//                    Spacer()
//
//                    Button{} label: {
//                        Image(systemName: "gear")
//                            .padding(15)
//                            .font(.system(size: 40))
//                    }
//                }//Hstack
//
//                Spacer()
//
//            }//Vstack
//            VStack{
//                Text("Adicione um dispositivo")
//                    .bold()
//                    .font(.title)
//
//                Button{} label:{
//                    ZStack{
//                        Circle()
//                            .fill(.yellow)
//                            .frame(width: 170)
//
//                        Image(systemName: "plus")
//                            .bold()
//                            .foregroundColor(.black)
//                            .font(.system(size: 60))
//                    }//Zstack
//                }//label
//            }
//        }//Zstack
//    }//body
//}//View
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
////adicionar navigationlink
