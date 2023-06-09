//
//  Bem.swift
//  oRacha
//
//  Created by Student17 on 13/03/23.
//

import SwiftUI

struct Bem: View {
    @State var falso = Teste.em
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(red: 210/255, green: 230/255, blue: 242/255, opacity: 1.0)
                    .ignoresSafeArea(.all)
                
                Spacer()
                    .navigationBarBackButtonHidden()
                    .toolbar(content: {
                        ToolbarItem(placement: .navigationBarLeading){
                            NavigationLink(destination: ContentView(), label: {
                                HStack{
                                    Image(systemName: "arrowshape.turn.up.backward.fill")
                                    
                                    Text("Retornar ao início")
                                }
                            })
                        }
                    })
                
                VStack{
                    Spacer()

                    Text("Esperamos que tenha sido um alarme falso.")
                        .bold()
                        .font(.title)
                        .padding(41)
                        .background(Color("amarelo"))

                    Spacer()

//                    Button{} label:{
//                        Text("Recalibrar")
//                            .foregroundColor(.black)
//                            .padding()
//                            .bold()
//                            .font(.title)
//                    }
//                    .background(Color("amarelo"))
//                    .clipShape(RoundedRectangle(cornerRadius: 30))
//                    .padding(60)

                    Spacer()

                    List{
                      Section(header: Text("\(falso.titulo)")
                        .font(.system(size:20))
                        .foregroundColor(.black)
                      ){
                          ForEach(falso.contato){ contato in
                              VStack{
                                  Button(action: {
                                      let phoneNumberformatted = ("tel://\(contato.phoneNumber!.stringValue.filter("0123456789.".contains))")
                                      print(phoneNumberformatted)
                                      
                                      guard let url = URL(string: phoneNumberformatted) else { return }
                                      
                                      UIApplication.shared.open(url)
                                  }) {
                                      Text("\(contato.firstName) \(contato.lastName)")
                                  }
                              }//Vstack
                          }//ForEach
                      } //Section
                    }//List
                     .scrollContentBackground(.hidden)
                }//Vstack
            }//Zstack
        }//Navigationstack
    }//body
}//struct

struct Bem_Previews: PreviewProvider {
    static var previews: some View {
        Bem()
    }
}

//adicionar navigationlink
