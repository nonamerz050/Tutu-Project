//
//  HeroesView.swift
//  Tutu Project
//
//  Created by MacBook Pro on 20/10/21.
//

import SwiftUI

struct HeroesView: View {
    
    @ObservedObject var viewModel = HeroesViewModel()
    @State var didAppear = false
    var body: some View {
        NavigationView {
            List(viewModel.heroes) { hero in
                NavigationLink(destination: HeroDetailsView(hero: hero), label: {
                    HStack {
                        Text("\(hero.name)")
                            .fontWeight(.semibold)
                            .lineLimit(2)
                    }
                })
            }
            .navigationTitle("Tutu Project")
        }
    }
}

struct HeroesView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesView()
    }
}
