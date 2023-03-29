//
//  nao_Bem.swift
//  oRacha
//
//  Created by Student17 on 13/03/23.
//

import SwiftUI

struct naoBem: View {
    @State var toMal = Ligar.emergencia
    
    var body: some View {
        ZStack{
            Spacer()
                .navigationBarBackButtonHidden()
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading){
                        NavigationLink(destination: ContentView(), label: {
                            HStack{
                                Image(systemName: "arrowshape.turn.up.backward.fill")
                                
                                Text("teste")
                            }
                        })
                    }
                })
            
            VStack{
                Text("Emergência acionada")
                    .padding(41)
                    .bold()
                    .font(.system(size: 30))

                NavigationStack{
                    List{
                        ForEach(toMal){emergencia in
                            Section(header: Text("\(emergencia.titulo)")){
                                ForEach(emergencia.contato){contato in
                                    VStack{
                                        Text("\(contato.nome)")
                                    }//Vstack
                                }//ForEach
                            }//Section
                        }//ForEach
                    }//List
                    .scrollContentBackground(.hidden)
    //                                .navigationTitle("Emergência acionada")
    //                                .navigationBarTitleDisplayMode(.large)
                }//Navigationstack
            }//Vstack
        }//Zstack
    }//body
}//struct

struct naoBem_Previews: PreviewProvider {
    static var previews: some View {
        naoBem()
    }
}

//adicionar navigationlink

