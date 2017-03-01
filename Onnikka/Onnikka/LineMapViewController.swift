//
//  LineMapViewController.swift
//  Onnikka
//
//  Created by Ville Marttila on 22/07/16.
//
//

import UIKit
import MapKit

class LineMapViewController: UIViewController, MKMapViewDelegate {
    
    // MARK: Properties
    @IBOutlet var mapView: MKMapView!
    
    var bussLine: BussLine?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = bussLine?.lineNumber!
        zoomToRegion()
        mapView.delegate = self
        
        
        // MARK: Select the Right Annotation
        
        if (bussLine?.lineNumber)! == "Linja 1" {
            loadDataFromPlistFile(selection: 1)
        }
        if (bussLine?.lineNumber)! == "Linja 2" || (bussLine?.lineNumber)! == "Linja 2N" {
            loadDataFromPlistFile(selection: 2)
        }
        if (bussLine?.lineNumber)! == "Linja 3" {
            loadDataFromPlistFile(selection: 3)
        }
        if (bussLine?.lineNumber)! == "Linja 4" || (bussLine?.lineNumber)! == "Linja 4N" {
            loadDataFromPlistFile(selection: 4)
        }
        if (bussLine?.lineNumber)! == "Linja 7" || (bussLine?.lineNumber)! == "Linja 7N" {
            loadDataFromPlistFile(selection: 7)
        }
        if (bussLine?.lineNumber)! == "Linja 8" {
            loadDataFromPlistFile(selection: 8)
        }
        if (bussLine?.lineNumber)! == "Linja 9" {
            loadDataFromPlistFile(selection: 9)
        }
        if (bussLine?.lineNumber)! == "Linja 10" {
            loadDataFromPlistFile(selection: 10)
        }
        if (bussLine?.lineNumber)! == "Linja 11" {
            loadDataFromPlistFile(selection: 11)
        }
        if (bussLine?.lineNumber)! == "Linja 14" {
            loadDataFromPlistFile(selection: 14)
        }
        if (bussLine?.lineNumber)! == "Linja 15" || (bussLine?.lineNumber)! == "Linja 15N"{
            loadDataFromPlistFile(selection: 15)
        }
        if (bussLine?.lineNumber)! == "Linja 17" {
            loadDataFromPlistFile(selection: 17)
        }
        if (bussLine?.lineNumber)! == "Linja 20" || (bussLine?.lineNumber)! == "Linja 20N"{
            loadDataFromPlistFile(selection: 20)
        }
        if (bussLine?.lineNumber)! == "Linja 21" {
            loadDataFromPlistFile(selection: 21)
        }
        if (bussLine?.lineNumber)! == "Linja 22" {
            loadDataFromPlistFile(selection: 22)
        }
        if (bussLine?.lineNumber)! == "Linja 23" {
            loadDataFromPlistFile(selection: 23)
        }
   }
    
    func loadDataFromPlistFile(selection: Int) {
        
        var annotations:Array = [Station]()

        //load plist file
        
        var stations: NSArray?
        if let path = Bundle.main.path(forResource: "BussLine\(selection)", ofType: "plist") {
            stations = NSArray(contentsOfFile: path)
        }
        if let items = stations {
            for item in items {
                
                let lat = (item as AnyObject).value(forKey: "stop_lat") as! String
                let long = (item as AnyObject).value(forKey: "stop_lon")as! String
                
                let latD = Double(lat)
                let longD = Double(long)
                
                let annotation = Station(latitude: latD!, longitude: longD!)
                
                annotation.title = (item as AnyObject).value(forKey: "stop_name") as? String
                annotations.append(annotation)
                
                
            }
        }
        
        mapView.addAnnotations(annotations)
        mapView.showAnnotations(annotations, animated: false)
        mapView.camera.altitude *= 3.0
    }
    
    

    
    // MARK: Zoom in to desired region
    
    func zoomToRegion() {
        
        let initialLocation = CLLocationCoordinate2D(latitude: 65.0094647, longitude: 25.462924)
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegion(center: initialLocation, span: span)
        mapView.setRegion(region, animated: false)
    }

    

    //MARK:- MapViewDelegate methods
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        let renderer = MKPolygonRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 2.0
        return renderer
    }
    
    
    // MARK: - Navigation
    
    
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    // MARK:- Custom Image for Annotation
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // Don't want to show a custom image if the annotation is the user's location.
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        // Better to make this class property
        let annotationIdentifier = "AnnotationIdentifier"
        
        var annotationView: MKAnnotationView?
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
        }
        else {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
        }
        
        if let annotationView = annotationView {
            // Configure your annotation view here
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "bussStation")
        }
        
        return annotationView
    }

}
