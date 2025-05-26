//
//  MuseumDataLoader.swift
//  task2-1
//
//  Created by Stepanov on 19.05.25.
//


import Foundation

class MuseumDataLoader {
    
    static func loadItems() -> [MuseumItem] {
        guard let path = Bundle.main.path(forResource: "museum_data", ofType: "plist"),
              let data = FileManager.default.contents(atPath: path),
              let itemsArray = try? PropertyListDecoder().decode([MuseumItem].self, from: data) else {
            return []
        }
        return itemsArray
    }
}