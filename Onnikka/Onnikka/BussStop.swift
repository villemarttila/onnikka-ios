//
//  BussStop.swift
//  Onnikka
//
//  Created by Ville Marttila on 18/07/16.
//
//

import Foundation
import MapKit

/*
class BussStop: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        
        super.init()
    }
    
    class func fromJSON(_ json: [JSONValue]) -> BussStop? {
    
        var title: String
        if let titleOrNil = json[2].string {
            title = titleOrNil
        } else {
            title = ""
        }
        let latitude = (json[4].string! as NSString).doubleValue
        let longitude = (json[5].string! as NSString).doubleValue
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        return BussStop(title: title, coordinate: coordinate)
    }
 
}
*/
