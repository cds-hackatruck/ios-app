//
//  Bem.swift
//  oRacha
//
//  Created by Student17 on 13/03/23.
//

import SwiftUI

struct Bem: View {
    @State var falso = Ligar.emergencia
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()

                Text("Se foi um alarme falso:")
                    .bold()
                    .font(.title)
                    .padding(41)
                    .navigationBarBackButtonHidden()

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

                List(falso){emerg in
                  Section(header: Text("\(emerg.titulo)")
                    .font(.system(size:20))
                  ){
                      ForEach(emerg.contato){contato in
                          VStack{
                              Text("\(contato.nome)")
                                  .bold()
                                  .font(.system(size: 20))
                          }//Vstack
                      }//ForEach
                  }//Section
                }//List
                 .scrollContentBackground(.hidden)
            }//Vstack
        }//Navigationstack
    }//body
}//struct

struct Bem_Previews: PreviewProvider {
    static var previews: some View {
        Bem()
    }
}

//adicionar navigationlink
