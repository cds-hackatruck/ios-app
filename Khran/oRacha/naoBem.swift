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
        VStack{
            Text("Emergência acionada")
                .padding(41)
                .bold()
                .font(.system(size: 30))
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {                                    Button {} label: {
                            HStack {
                                Image(systemName: "chevron.backward")
                                Text("Custom Back")
                            }
                        }
                    }
                }

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
                .navigationBarBackButtonHidden()
//                                .navigationTitle("Emergência acionada")
//                                .navigationBarTitleDisplayMode(.large)
            }//Navigationstack
        }//Vstack
    }//body
}//struct

struct naoBem_Previews: PreviewProvider {
    static var previews: some View {
        naoBem()
    }
}

//adicionar navigationlink

