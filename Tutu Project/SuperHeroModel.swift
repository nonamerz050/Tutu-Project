//
//  WeatherModel.swift
//  Tutu Project
//
//  Created by MacBook Pro on 20/10/21.
//

import Foundation

struct Hero: Codable, Identifiable {
    var id: Int
    let name: String
    let powerstats: Powerstats
    let appearance: Appearance
    let biography: Biography
}

struct Powerstats: Codable {
    let strength: Int
    let speed: Int
    let power: Int
}

struct Appearance: Codable {
    let gender: String
    let race: String
}

struct Biography: Codable {
    let fullName: String
    let alterEgos: String
    let placeOfBirth: String
    
}

