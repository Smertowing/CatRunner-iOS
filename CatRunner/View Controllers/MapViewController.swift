//
//  MapViewController.swift
//  CatRunner
//
//  Created by Kiryl Holubeu on 10/30/18.
//  Copyright © 2018 Kiryl Holubeu. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        mapView.animate(to: GMSCameraPosition.camera(withLatitude: (self.locationManager.location?.coordinate.latitude ?? 0), longitude:(self.locationManager.location?.coordinate.longitude ?? 0), zoom:14))
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        
        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude:(location?.coordinate.longitude)!, zoom:14)
        mapView.animate(to: camera)
        
        self.locationManager.stopUpdatingLocation()
    }

}
