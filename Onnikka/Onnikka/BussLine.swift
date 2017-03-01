//
//  BussLine.swift
//  Onnikka
//
//  Created by Ville Marttila on 21/07/16.
//
//

import UIKit

class BussLine {
    
    // MARK: Properties
    
    let lineName: String?
    let lineNumber: String?
    let driveTime: String?
    let bussNumber: UIImage
    
    // MARK: Initialization
    init?(lineName: String, lineNumber: String, driveTime: String, bussNumber: UIImage) {
        
        // Initialize stored properties
        self.lineName = lineName
        self.lineNumber = lineNumber
        self.driveTime = driveTime
        self.bussNumber = bussNumber
    }    
}
