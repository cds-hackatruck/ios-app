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

                    Text("Se foi um alarme falso:")
                        .bold()
                        .font(.title)
                        .padding(41)

                    Spacer()

                    Button{} label:{
                        Text("Recalibrar")
                            .foregroundColor(.black)
                            .padding()
                            .bold()
                            .font(.title)
                    }
                    .background(Color(.yellow))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .padding(60)

                    Spacer()

                    List{
                      Section(header: Text("\(falso.titulo)")
                        .font(.system(size:20))
                      ){
                          ForEach(falso.contato){ contato in
                              VStack{
                                  Text("\(contato.firstName)")
                                      .bold()
                                      .font(.system(size: 20))
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
