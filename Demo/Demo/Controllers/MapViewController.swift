//
//  MapViewController.swift
//  Demo
//
//  Created by user259867 on 5/8/24.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        render(location: LocationManager.shared.currentLocation!)
        
    }
    
    
    func render(location: CLLocation){
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let span  = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let regino = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(regino, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
        
    }

    

}
