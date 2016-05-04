//
//  ParkingLotAnnotation.swift
//  mapview-test
//
//  Created by Mohamad Asyraaf on 3/5/16.
//  Copyright © 2016 Mohamad Asyraaf bin Abdul Rahman. All rights reserved.
//

import Foundation
import MapKit

class ParkingLotAnnotation:NSObject,MKAnnotation{ ///An annotation is a representation o the map.
    
    var coordinate = CLLocationCoordinate2D()
    
    
    init(coordinate:CLLocationCoordinate2D){
        self.coordinate = coordinate
    }
    
    
    
}
