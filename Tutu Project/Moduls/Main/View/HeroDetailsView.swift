//
//  HeroDetailsView.swift
//  Tutu Project
//
//  Created by MacBook Pro on 20/10/21.
//

import SwiftUI

struct HeroDetailsView: View {
    var hero: Hero
    var body: some View {
        Text(hero.name)
            .font(.system(size: 24, weight: .bold))
            .padding(.bottom)
        VStack(alignment: .leading, spacing: 4) {
            Text("Powerstats:")
                .fontWeight(.semibold)
            Text("""
                Strength: \(hero.powerstats.strength)
                Speed: \(hero.powerstats.speed)
                Power: \(hero.powerstats.power)
                """)
                .padding(.bottom)
            Text("Apperance:")
                .fontWeight(.semibold)
            Text("""
                Gender: \(hero.appearance.gender)
                Race: \(hero.appearance.race)
                """)
                .padding(.bottom)
            Text("Biography:")
                .fontWeight(.semibold)
            Text("""
                Full name: \(hero.biography.fullName)
                Alter Egos: \(hero.biography.alterEgos)
                Place of birth: \(hero.biography.placeOfBirth)
                """)
            Spacer()
        }
    }
}

