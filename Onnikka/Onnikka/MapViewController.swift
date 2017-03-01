//
//  MapViewController.swift
//  Onnikka
//
//  Created by Ville Marttila on 12.5.2016.
//
//

import UIKit
import MapKit
import CoreData

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    // MARK: Properties
    @IBOutlet weak var mapView: MKMapView!

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        
    if (CLLocationManager.locationServicesEnabled())
        {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }

        // Do any additional setup after loading the view.
        
        //loadInitialData()
        //mapView.addAnnotations(BussStops)
        

    }

    // var BussStops = [BussStop]()

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08))
        
        self.mapView.setRegion(region, animated: false)
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error while updating location" + error.localizedDescription)
    }
    
    
    /*
    func loadInitialData() {
        
        let fileName = Bundle.main.path(forResource: "Stops", ofType: "json");
        
        var data: Data?
        do {
            data = try Data(contentsOf: URL(fileURLWithPath: fileName!), options: NSData.ReadingOptions(rawValue: 0))
        } catch _ {
            data = nil
        }
        
        var jsonObject: AnyObject? = nil
        if let data = data {
            do {
                jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue: 0))
            } catch _ {
                jsonObject = nil
            }
        }
        
        if let jsonObject = jsonObject as? [String: AnyObject],
            // 4
            let jsonData = JSONValue.fromObject(jsonObject)?["data"]?.array {
            for bussStopJSON in jsonData {
                if let bussStopJSON = bussStopJSON.array,
                    // 5
                    let BussStop = BussStop.fromJSON(bussStopJSON) {
                    BussStops.append(BussStop)
                }
            }
        }
        print([BussStops])
    }
 */
       
    /*
    func addStops() {
        let moc = DataController().managedObjectContext
        
        let entity = NSEntityDescription.insertNewObjectForEntityForName("Stops", inManagedObjectContext: moc) as! Stops
        
        entity.setValue("Toripakka P", forKey: "name")
        entity.setValue(65.014231, forKey: "latitude")
        entity.setValue(25.469017, forKey: "longitude")
        entity.setValue("Oulun suosituin pysäkki", forKey: "desc")
        
        do {
            try moc.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
        
    }
    
    func fetch() {
        let moc = DataController().managedObjectContext
        let stopsFetch = NSFetchRequest(entityName: "Stops")
        
        do {
            let fetchedStop = try moc.executeFetchRequest(stopsFetch) as! [Stops]
            print(fetchedStop.first!.name!)
            print(fetchedStop.first!.latitude!)
            print(fetchedStop.first!.longitude!)
            print(fetchedStop.first!.desc!)
            
        } catch {
            fatalError("Failed to fetch person: \(error)")
        }
    }
    */
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
