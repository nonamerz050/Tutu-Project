//
//  HeroesViewModel.swift
//  Tutu Project
//
//  Created by MacBook Pro on 20/10/21.
//

import SwiftUI

class HeroesViewModel: ObservableObject {
    let jsonUrl = ["https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/id/213.json",
                   "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/id/208.json",
                   "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/id/308.json",
                   "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.2.0/api/id/212.json"]
    @Published var heroes: [Hero] = []

    let dataKey = "heroes_list"
    
    init() {
        getData()
    }
    
    func getData() {
        guard
            let data = UserDefaults.standard.data(forKey: dataKey),
            let savedData = try? JSONDecoder().decode([Hero].self, from: data)
        else { return }
        self.heroes = savedData
        
        for url in jsonUrl {
            var isEqual = false
            NetworkManager.shared.fetchData(from: url) { getHero in
                for hero in self.heroes {
                    if getHero.name == hero.name {
                        isEqual = true
                    }
                }
                if !isEqual {
                    self.heroes.append(getHero)
                }
            }
        }
    }
    func saveData() {
        if let encodedData = try? JSONEncoder().encode(heroes) {
            UserDefaults.standard.set(encodedData, forKey: dataKey)
        }
    }
}
