//
//  ContentView.swift
//  oRacha
//
//  Created by Student17 on 13/03/23.
// fcc010 - amarelo

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State var oldTimestamp = 0
    @State var firstRead = true
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(red: 210/255, green: 230/255, blue: 242/255, opacity: 1.0)
                    .ignoresSafeArea(.all)
                
//                LinearGradient(colors: [Color("marrom"), .orange],
//                               startPoint: .bottom, endPoint: .center)
//                .ignoresSafeArea(.all)
                
                Spacer()
                    .navigationBarBackButtonHidden()
            
            
                VStack{
                    Text("Khran")
                        .navigationBarTitleDisplayMode(.inline)
                        .font(.system(size: 60))
                        .bold()
                        .padding(.bottom, 60)
                        .padding(.top, 40)
                    
                    VStack{
                        Text("Aceleração")
                            .font(.system(size: 30))
                            .bold()
                            .foregroundColor(.black)
                            .toolbar{
                                NavigationLink(destination: AddContatos(),
                                               label: {Image(systemName: "gear")
                                }
                                )//Navigationlink
                                .font(.title)
                            }//toolbar
                        
                        Text("\(viewModel.gforce.gforce)")
                            .padding(.top, -5)
                            .foregroundColor(.black)
                            .font(.title)
                    }//Vstack
                    .padding()
                    .background(Color("amarelo"))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    
                    Spacer()
                    
//                    Text("\(viewModel.gforce.timestamp)")
                    
//                    Spacer()
                    
                    HStack{
                        VStack{
                            Text("Latitude")
                                .bold()
                                .foregroundColor(.black)
                                .font(.title2)
                            
                            Text("\(viewModel.gforce.position.latitude)")
                                .font(.title2)
                                .foregroundColor(.black)
                        }//Vstack
                        .padding()
                        .background(Color("amarelo"))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        
                        VStack{
                            Text("Longitude")
                                .bold()
                                .foregroundColor(.black)
                                .font(.title2)
                            
                            Text("\(viewModel.gforce.position.longitude)")
                                .font(.title2)
                                .foregroundColor(.black)
                        }//Vstack
                        .padding()
                        .background(Color("amarelo"))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                    }//Hstack
                    .frame(width: 400,height: 100)
                    .background(Color("amarelo"))
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: Acionado(),
                        isActive: Binding<Bool>(
                            get: { self.oldTimestamp != viewModel.gforce.timestamp && firstRead == false},
                            set: { _ in }
                        ), label: { EmptyView() }
                    )//Naviagtionlink
                }//Vstack
                .onChange(of: viewModel.gforce.timestamp) { newValue in
                    if(firstRead == true){
                        firstRead = false
                    }//if
                    if self.oldTimestamp != newValue {
                        self.oldTimestamp = newValue
                    }//if
                }//onchange
            }//Zstack
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                    viewModel.fetch()
                }//timer
            }//onappear
        }//Navigationstack
    }//body
}//View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

