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
    
    @IBOutlet weak var barTime: UIBarButtonItem!
    @IBOutlet weak var barStartButton: UIBarButtonItem!
    @IBOutlet weak var barStopButton: UIBarButtonItem!
    @IBOutlet weak var mapView: GMSMapView!
    
    var locationManager = CLLocationManager()
    var hItem: HistoryItem?
//    var startTime: Date = Date()
    
    var counter = 0.0
    var timer = Timer()
    var isTimerRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        mapView.animate(to: GMSCameraPosition.camera(withLatitude: (self.locationManager.location?.coordinate.latitude ?? 0), longitude:(self.locationManager.location?.coordinate.longitude ?? 0), zoom:14))
        
        barStopButton.isEnabled = false
    }
    
    @IBAction func barStart(_ sender: Any) {
        
        guard !isTimerRunning else { return }
        
        hItem = HistoryItem(km: 0, time: 0)
   //     startTime = Date()
        counter = 0.0
        barTime.title = String(format: "%.1f", counter)
        barStartButton.isEnabled = false
        barStopButton.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    @IBAction func barStop (_ sender: Any) {
      /*  let finishTime = Date()
        let calendar = Calendar.current
        let hours = calendar.component(.hour, from: finishTime) - calendar.component(.hour, from: startTime)
        let minutes = calendar.component(.minute, from: finishTime) - calendar.component(.minute, from: startTime)
        let seconds = calendar.component(.second, from: finishTime) - calendar.component(.second, from: startTime) */
        barStartButton.isEnabled = true
        barStopButton.isEnabled = false
        timer.invalidate()
        isTimerRunning = false
        barTime.title = String(format: "%.1f", counter)
        hItem?.time = counter
        UserHistory.items.append(hItem!)
    }
    
    @objc func UpdateTimer() {
        counter = counter + 0.1
        barTime.title = String(format: "%.1f", counter)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        
        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude:(location?.coordinate.longitude)!, zoom:14)
        mapView.animate(to: camera)
        
        self.locationManager.stopUpdatingLocation()
    }

}
