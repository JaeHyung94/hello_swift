//
//  ViewController.swift
//  Hello_Swift
//
//  Created by 박재형 on 2022/07/26.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate{
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var labelAddress: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelTitle.text = ""
        labelAddress.text = ""
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
    }
    
    func goLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees, delta span:Double) -> CLLocationCoordinate2D {
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let region = MKCoordinateRegion(center: location, span: spanValue)
        
        mapView.setRegion(region, animated: true)
        
        return location
    }
    
    func setAnnotation(latitude: CLLocationDegrees, longitude: CLLocationDegrees, delta span: Double, title: String, subtitle: String) {
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = goLocation(latitude: latitude, longitude: longitude, delta: span)
        
        annotation.title = title
        annotation.subtitle = subtitle
        mapView.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        _ = goLocation(latitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.latitude)!, delta: 0.01)
        
        CLGeocoder().reverseGeocodeLocation(location!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.labelTitle.text = "현재 위치"
            self.labelAddress.text = address
        })
        
        locationManager.stopUpdatingLocation()
    }

    @IBAction func handleSelectLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.labelTitle.text = "현재 위치"
            self.labelAddress.text = ""
            locationManager.startUpdatingLocation()
        } else if sender.selectedSegmentIndex == 1 {
            setAnnotation(latitude: 37.57, longitude: 126.9081, delta: 1, title: "집", subtitle: "대림아파트")
            
            self.labelTitle.text = "보고 계신 위치"
            self.labelAddress.text = "월드타운 대림아파트"
        } else if sender.selectedSegmentIndex == 2 {
            setAnnotation(latitude: 37.5634, longitude: 126.9347, delta: 1, title: "학교", subtitle: "연세대학교 과학원")
            
            self.labelTitle.text = "보고 계신 위치"
            self.labelAddress.text = "연세대학교 과학원"
        }
    }
    
  }
