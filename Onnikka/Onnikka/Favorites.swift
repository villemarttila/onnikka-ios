//
//  Favorites.swift
//  Onnikka
//
//  Created by Ville Marttila on 12.5.2016.
//
//

import UIKit

class Favorite {
    // MARK: Properties
    
    var name: String
    var emoji: String
    var address: String
    var bussNumber: UIImage
    var description: String
    var time: String
    
    // MARK: Initialization
    init?(name: String, emoji: String, address: String, bussNumber: UIImage, description: String, time: String) {
        
        // Initialize stored properties
        self.name = name
        self.emoji = emoji
        self.address = address
        self.bussNumber = bussNumber
        self.description = description
        self.time = time
    }
}

