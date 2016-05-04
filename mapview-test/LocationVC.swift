//
//  SecondViewController.swift
//  mapview-test
//
//  Created by Mohamad Asyraaf on 3/5/16.
//  Copyright © 2016 Mohamad Asyraaf bin Abdul Rahman. All rights reserved.
//

import UIKit
import MapKit

class LocationVC: UIViewController,UITableViewDelegate,UITableViewDataSource,MKMapViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!

    let locationManager = CLLocationManager()
    let regionRadius: CLLocationDistance = 1000
    
    let addresses = ["4 Tampines Central 5, 529510","1 Pasir Ris Central Street 3", "White Sands, 519599,3 Simei Street 6, Singapore 528833"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        mapView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        
        for add in addresses{
            getPlaceMarkForAddress(add)
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        LocationAuthStatus()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func createAnnotationForLocation(location:CLLocation){
        let mall = ShoppingMallAnnotation(coordinate: location.coordinate)
        mapView.addAnnotation(mall)
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.isKindOfClass(ShoppingMallAnnotation){
            let annoView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Default")
            annoView.pinTintColor = UIColor.blueColor()
            annoView.animatesDrop = true
            
            return annoView
        }
        
        return nil
    }
    
    func getPlaceMarkForAddress(address:String){ //to create a place mark(Red pin) for address.
        CLGeocoder().geocodeAddressString(address) { (placemarks: [CLPlacemark]?, error:NSError?) in //method to parse string address to location(containing lan + lon
            if let marks = placemarks where marks.count > 0 { //checks if there are placemarks for that address
                if let loc = marks[0].location{ //gets the place location
                    self.createAnnotationForLocation(loc) //creates annotation for the location?Difference between annotation and placemark?
                }
            }
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
      
    }
    
    func LocationAuthStatus(){ //checks to see if there is permission to use the user's location
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse{ //Authorizes to use loc services when app is running in foreground
                                                                             //.Authorized always(Authorizes whenever,including background is not recommended
            mapView.showsUserLocation = true
        }else{
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func centerMapOnLocation(location: CLLocation){
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2, regionRadius * 2)
        mapView.setRegion(coordinateRegion, animated: true)
        
    }
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        if let location = userLocation.location{
            centerMapOnLocation(location)
        }
    }

    

}

