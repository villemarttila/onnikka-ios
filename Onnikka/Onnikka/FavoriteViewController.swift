//
//  FavoriteViewController.swift
//  Onnikka
//
//  Created by Ville Marttila on 12.3.2016.
//
//

import UIKit
import MapKit

class FavoriteViewController: UIViewController, UITableViewDelegate, CLLocationManagerDelegate {
    
    // MARK: Properties
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet var favoriteTableView: UITableView!
    
    @IBOutlet var addButton: UIBarButtonItem!
    
    let locationManager = CLLocationManager()
    var favorites = [Favorite]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Use the edit button items provided by the controller view controller
        navigationItem.leftBarButtonItem = editButtonItem
        
        // Load sample busses
        loadSampleBusses()
        
        // For use in background
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if (CLLocationManager.locationServicesEnabled())
        {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        }
        
        
    }
    
    func loadSampleBusses() {
        let bussNumber1 = UIImage(named: "bussNumber1")!
        let favorite1 = Favorite(name: "Koti", emoji: "o", address: "Kultatie 3", bussNumber: bussNumber1, description: "Saapuu 13min päästä", time: "14.32")!
        
        let bussNumber2 = UIImage(named: "bussNumber14")!
        let favorite2 = Favorite(name: "Työ", emoji: "o", address: "Isokatu 47", bussNumber: bussNumber2, description: "Saapuu 2min päästä", time: "14.13")!
        
        favorites += [favorite1, favorite2]
    }
 
    
    // MARK: MapKit functions
   
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.mapView.setRegion(region, animated: true)
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error while updating location" + error.localizedDescription)
    }
    
    func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) {
    }
    
    
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    private func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoriteTableView.dequeueReusableCell(withIdentifier: "FavoriteTableViewCell", for: indexPath) as! FavoriteTableViewCell
        
        // Fetches the appropriate buss for the data source layout
        let favorite = favorites[indexPath.row]
        
        cell.nameLabel.text = favorite.name
        cell.bussIdImage.image = favorite.bussNumber
        cell.descriptionLabel.text = favorite.description
        cell.timeLabel.text = favorite.time
        
        return cell
    }
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
        favorites.remove(at: (indexPath as NSIndexPath).row)
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
 */
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
     // MARK: - Navigation
    
    
    
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
    
    @IBAction func unwindForSegue(_ sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? NewFavoriteViewController, let favorite = sourceViewController.favorite {
            
            // Add a new favorite
            let newIndexPath = IndexPath(row: favorites.count, section: 0)
            
            favorites.append(favorite)
            
            favoriteTableView.insertRows(at: [newIndexPath], with: .bottom)
        }
    }
    


}

