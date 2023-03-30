//
//  MakeCall.swift
//  oRacha
//
//  Created by Student11 on 29/03/23.
//

import SwiftUI

struct MakeCall: View {
    var phoneNumber = "(19) 99739-1955"
    
    var body: some View {
        VStack {
            Button(action: {
                let phone = "tel://"
                let phoneNumberformatted = phone + phoneNumber
                
                guard let url = URL(string: phoneNumberformatted) else { return }
                
                UIApplication.shared.open(url)
               }) {
               Text(phoneNumber)
                .foregroundColor(.blue)
            }
        }
    }
}

struct MakeCall_Previews: PreviewProvider {
    static var previews: some View {
        MakeCall()
    }
}
