////
////  nao_Bem.swift
////  oRacha
////
////  Created by Student17 on 13/03/23.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    @State var addItem = false
//    
//    var body: some View {
//        NavigationView{
//            ZStack{
//                VStack{
//                    Text("Configurações")
//                        .bold()
//                        .font(.system(size: 20))
//                    
//                    List{
//                        Text("Adicione um contato de emergência")
//                            .font(.title3)
//                    }
//                    .scrollContentBackground(.hidden)
//                    .toolbar {
//                        ToolbarItem(placement: .navigation){
//                            Button(action: {
//                                self.addItem.toggle()}){
//                                    Image(systemName: "plus")
//                                }
//                        }
//                    }
//                }
//                
//                Button{} label:{
//                    Text("Recalibrar sensor")
//                        .foregroundColor(.black)
//                        .padding()
//                        .bold()
//                        .font(.title)
//                    }
//                    .background(Color(.yellow))
//                    .clipShape(RoundedRectangle(cornerRadius: 30))
//                    .padding()
//            }//Zstack
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
//
