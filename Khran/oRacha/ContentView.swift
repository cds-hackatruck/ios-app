//
//  ContentView.swift
//  oRacha
//
//  Created by Student17 on 13/03/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State var oldTimestamp = 0
    @State var firstRead = true
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("G - Force in Crash")
                    .font(.title)
                    .bold()
                Text("\(viewModel.gforce.gforce)")
                Text("\(viewModel.gforce.timestamp)")
                HStack{
                    Text("\(viewModel.gforce.position.latitude)")
                    Text("\(viewModel.gforce.position.longitude)")
                }
                NavigationLink(
                    destination: Acionado(),
                    isActive: Binding<Bool>(
                        get: { self.oldTimestamp != viewModel.gforce.timestamp && firstRead == false},
                        set: { _ in }
                    ),
                    label: { EmptyView() }
                    )
            }
            .onChange(of: viewModel.gforce.timestamp) { newValue in
                if(firstRead == true){
                    firstRead = false
                }
                if self.oldTimestamp != newValue {
                    self.oldTimestamp = newValue
                }
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                viewModel.fetch()
            }
        }
    }
}//View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
