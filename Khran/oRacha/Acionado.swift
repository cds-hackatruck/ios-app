////
////  ContentView.swift
////  oRacha
////
////  Created by Student17 on 13/03/23.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    @State private var progress = 1.0
//    @State private var count = 60
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//
//    var body: some View {
//        GeometryReader {geo in
//            VStack{
//                Spacer()
//
//                Text("Você está bem?")
//                    .bold()
//                    .font(.system(size: 38))
//
//                Spacer()
//
//                ZStack{
//                    Circle()
//                        .trim(from: 0, to: progress)
//                        .stroke(style: StrokeStyle(
//                            lineWidth: 10,
//                            lineCap: .round,
//                            lineJoin: .round))
//                        .foregroundColor(.yellow)
//
//                Spacer()
//
//                }//Zstack
//                .padding(30)
//                .frame(height: geo.size.width)
//                .rotationEffect(.degrees(-90))
//                .animation(.easeInOut(duration: 1.5), value: progress)
//                .overlay(
//                    Button{} label:{
//                        ZStack{
//                            Circle()
//                                .fill(.yellow)
//                                .padding(36)
//
//                            Text("Não")
//                                .foregroundColor(.black)
//                                .bold()
//                                .font(.system(size: 60))
//                        }
//                    }
//                )
//                .onReceive(timer){ _ in
//                    progress -= 0.017
//                    count -= 1
//                    if progress <= 0.0 || count <= 0 {
//                        timer.upstream.connect().cancel()
//                    }//if
//                }//onreceive
//
//                Spacer()
//
//                Button{} label: {
//                    Text("Sim")
//                        .foregroundColor(.black)
//                        .font(.title)
//                        .bold()
//                        .padding(30)
//                }
//                .background(Color(.yellow))
//                .clipShape(RoundedRectangle(cornerRadius: 40))
//                .padding(60)
//
//                Spacer()
//            }//Vstack
//        }//Geometryreader
//        .padding(50)
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
