//
//  VCMapView.swift
//  Onnikka
//
//  Created by Ville Marttila on 18/07/16.
//
//

import Foundation

import MapKit

extension MapViewController: MKMapViewDelegate {
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // Don't want to show a custom image if the annotation is the user's location.
        guard !annotation.isKind(of: MKUserLocation.self) else {
            return nil
        }
        
        let annotationIdentifier = "AnnotationIdentifier"
        
        /*
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(annotationIdentifier)
        if pinView != nil {
            pinView!.annotation = annotation;
        } else {
            pinView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
        }
        */
        
        var annotationView: MKAnnotationView?
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
        }
        else {
            let av = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            av.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            annotationView = av
        }

 
        
        if let annotationView = annotationView {
            
            // Configure your annotation view here
            
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "bussStopInactive")
            
        }
 
        
        return annotationView
    }

}
