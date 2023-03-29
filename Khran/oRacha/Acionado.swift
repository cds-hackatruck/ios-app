
//  ContentView.swift
//  oRacha
//
//  Created by Student17 on 13/03/23.
//

import SwiftUI
import AVFoundation

struct Acionado: View {
    @State private var progress = 1.0
    @State private var count = 60
    @State var pushActive = false
    
    @State var audioPlayer: AVAudioPlayer!
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationStack{
            GeometryReader {geo in
                VStack{
                    Spacer()

                    Text("Você está bem?")
                        .bold()
                        .font(.system(size: 38))

                    Spacer()

                    
                    NavigationLink(destination: naoBem()){
                        ZStack{
                            Circle()
                                .trim(from: 0, to: progress)
                                .stroke(style: StrokeStyle(
                                    lineWidth: 10,
                                    lineCap: .round,
                                    lineJoin: .round))
                                .foregroundColor(.yellow)
                        }//Zstack
                        .padding(60)
                        .frame(height: geo.size.width)
                        .rotationEffect(.degrees(-90))
                        .animation(.easeInOut(duration: 1.5), value: progress)
                        .overlay(
                            ZStack{
                                Circle()
                                    .fill(.yellow)
                                    .padding(66)
                                    
                                Text("Não")
                                    .foregroundColor(.black)
                                    .bold()
                                    .font(.system(size: 60))
                            }//Zstack
                        )//overlay
                        .onReceive(timer){ _ in
                            progress -= 0.017
                            count -= 1
                            if progress <= 0.0 || count <= 0 {
                                timer.upstream.connect().cancel()
                                self.pushActive = true
                            }//if
                        }//onreceive
                    }//Navigationlink

                    Spacer()

                    NavigationLink(destination: Bem()){
                        Text("Sim")
                        .foregroundColor(.black)
                        .font(.title)
                        .bold()
                        .padding(30)
                        .background(Color(.yellow))
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                        .padding(60)
                    }//Navigationlink

                    Spacer()
                    
                    NavigationLink(destination: naoBem(),
                       isActive: self.$pushActive) {}.hidden()
                }//Vstack
            }//Geometryreader
            .onDisappear() {
                self.timer.upstream.connect().cancel()
            }//onDisappear
        }//Navigationstack
        
//        .onAppear(perform: {
//          playSounds("")
//        })
        
    }//body
    
    func playSounds(_ soundFileName : String) {
        guard let soundURL = Bundle.main.url(forResource: soundFileName,
                                             withExtension: nil) else {
            fatalError("Unable to find \(soundFileName) in bundle")
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
        } catch {
            print(error.localizedDescription)
        }
        audioPlayer.play()
    }
}//View
    

struct Acionado_Previews: PreviewProvider {
    static var previews: some View {
        Acionado()
    }
}
