//
//  NetworkManager.swift
//  Tutu Project
//
//  Created by MacBook Pro on 20/10/21.
//

import SwiftUI

class NetworkManager {
    static let shared = NetworkManager()
    init() {}
    
    func fetchData(from urlString: String, with complition: @escaping (Hero) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error { print(error); return }
            guard let data = data else { return }
            DispatchQueue.main.async {
                let hero = try! JSONDecoder().decode(Hero.self, from: data)
                complition(hero)
            }
        }
        .resume()
    }
}
