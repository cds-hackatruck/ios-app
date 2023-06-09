//
//  ViewModel.swift
//  oRacha
//
//  Created by Student15 on 28/03/23.
//

import Foundation

struct D_Packet : Codable{
    var timestamp : Int
    var gforce : Float
    var position : Position
}

struct Position : Codable{
    var latitude : Float
    var longitude : Float
}

class ViewModel : ObservableObject {
    @Published var gforce : D_Packet = D_Packet(timestamp: 0, gforce: 0, position: Position(latitude: 0, longitude: 0))
    
    func fetch(){
        print("fetch")
        guard let url = URL(string: "http://192.168.128.200:1880/khran/read")else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let parsed = try JSONDecoder().decode(D_Packet.self, from: data)
                
                DispatchQueue.main.async {
                    if(parsed.timestamp != self?.gforce.timestamp){
                        self?.gforce = parsed
                    }
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
    
}
