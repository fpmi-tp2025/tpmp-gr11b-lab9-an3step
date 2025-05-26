//
//  MuseumItem.swift
//  task2-1
//
//  Created by Stepanov on 19.05.25.
//


import Foundation
import UIKit

struct MuseumItem: Codable {
    let name: String
    let description: String
    let history: String
    let imageName: String

    var image: UIImage? {
        return UIImage(named: imageName)
    }
}
