//
//  NewFavoriteViewController.swift
//  Onnikka
//
//  Created by Ville Marttila on 19.5.2016.
//
//

import UIKit
import MapKit

class NewFavoriteViewController: UIViewController, UITextFieldDelegate, UISearchBarDelegate {
    
    // MARK: Properties
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var saveButton: UIBarButtonItem!
    @IBOutlet weak var addressTextField: UITextField!
    
    var searchController: UISearchController!
    var annotation: MKAnnotation!
    var localSearchRequest: MKLocalSearchRequest!
    var localSearh: MKLocalSearch!
    var localSearchResponse: MKLocalSearchResponse!
    var error: NSError!
    var pointAnnotation: MKPointAnnotation!
    var pinAnnotationView: MKPinAnnotationView!
    
    var matchingItems: [MKMapItem] = []

    
    // This value is either passed by "FavoriteViewController" in "prepareForSegue(_:sender)" or constructed as part of adding a new favorite.
    var favorite: Favorite?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        
        
        loadOuluLocation()
        
        // Handle the text field's user input throught delegate cellbacks
        nameTextField.delegate = self
        addressTextField.delegate = self

        // Enable the Save button only if the text fields have a valid name and address
        checkValidFavoriteName()
        
        
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.nameTextField {
            self.nameTextField.resignFirstResponder()
            self.addressTextField.becomeFirstResponder()
            
        }
        if textField == self.addressTextField {
            startSearch()
            }
        
        return false
        
    }
    
        
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkValidFavoriteName()
    }
    
    func checkValidFavoriteName() {
        // Disable the Save button if the Name field is empty
        let textName = nameTextField.text ?? ""
        saveButton.isEnabled = !textName.isEmpty
    }
    
    
    
    // MARK: UIMapKitDelegate
    
    func startSearch() {
        
        if self.mapView.annotations.count != 0{
            annotation = self.mapView.annotations[0]
            self.mapView.removeAnnotation(annotation)
        }
        
        localSearchRequest = MKLocalSearchRequest()
        localSearchRequest.naturalLanguageQuery = addressTextField.text
        localSearh = MKLocalSearch(request: localSearchRequest)
        localSearh.start{(localSearchResponse, error) -> Void in
            
            if localSearchResponse == nil {
                let alertController = UIAlertController(title: "Ei tuloksia", message: "Tarkista osoite ja kokeile uudestaan", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Sulje", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                return
            }
            
            self.pointAnnotation = MKPointAnnotation()
            self.pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: localSearchResponse!.boundingRegion.center.latitude, longitude: localSearchResponse!.boundingRegion.center.longitude)
            
            self.pinAnnotationView = MKPinAnnotationView(annotation: self.pointAnnotation, reuseIdentifier: nil)
            self.mapView.centerCoordinate = self.pointAnnotation.coordinate
            self.mapView.addAnnotation(self.pinAnnotationView.annotation!)
        }
    }

    
    func loadOuluLocation() {
        // Set map region to Oulu
        let initialLocation = CLLocationCoordinate2D(latitude: 65.0094647, longitude: 25.462924)
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegion(center: initialLocation, span: span)
        mapView.setRegion(region, animated: false)
    }
    

    
    // MARK: - Navigation
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    // This method lets you configure a view controller before it's presented
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let barButton = sender as? UIBarButtonItem {
        if saveButton === barButton {
            let name = nameTextField.text ?? ""
            let address = addressTextField.text ?? ""
            
            // Set the favorite to be passed to FavoriteViewController after the unwind segue
            // !! Fetch bussNumber in different indexPath later !!
            let bussNumber = UIImage(named: "bussNumber8")!
            favorite = Favorite(name: name, emoji: "", address: address, bussNumber: bussNumber, description: "", time: "")!
            
            }
        }
    }
 

    
    // MARK: Actions
    
    // Add a pin to map if user long presses location
    
    @IBAction func addPin(_ sender: UILongPressGestureRecognizer) {
        
        let location = sender.location(in: self.mapView)
        let locCoord = self.mapView.convert(location, toCoordinateFrom: self.mapView)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = locCoord
        
        self.mapView.removeAnnotations(mapView.annotations)
        self.mapView.addAnnotation(annotation)
        
    }
    
}

    // MARK: Extensions

    // Extension for hiding the keyboard when tapped anywhere else
    extension UIViewController {
        func hideKeyboardWhenTappedAround() {
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
            view.addGestureRecognizer(tap)
        }
        
        func dismissKeyboard() {
            view.endEditing(true)
        }
    }

