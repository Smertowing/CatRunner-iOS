//
//  ProfileStructs.swift
//  CatRunner
//
//  Created by Kiryl Holubeu on 11/8/18.
//  Copyright © 2018 Kiryl Holubeu. All rights reserved.
//

import Foundation

struct ProfileStruct: Decodable {
    var nickname: String
    var gender: String
    var height: Int
    var weight: Int
    var history: [HistoryItemStruct]
    var settings: SettingsTemplate
}

struct SettingsTemplate: Decodable {
    var unit: String
    var sounds: Bool
    var map: String
    var theme: String
    var language: String
}
//.tcx/.gpx/.kml/свой формат - это форматы runtastic, которые хранят маршрут, время и тд.
struct HistoryItemStruct: Decodable {
    var route:  [Coordinates]
}

struct Coordinates: Decodable {
    var latitude: Double
    var longitude: Double
}
