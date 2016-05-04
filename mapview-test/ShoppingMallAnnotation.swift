//
//  ShoppingMallAnnotation.swift
//  mapview-test
//
//  Created by Mohamad Asyraaf on 4/5/16.
//  Copyright © 2016 Mohamad Asyraaf bin Abdul Rahman. All rights reserved.
//

import Foundation
import MapKit
class ShoppingMallAnnotation:NSObject,MKAnnotation{
    
    var coordinate = CLLocationCoordinate2D()
    
    init(coordinate:CLLocationCoordinate2D){
        self.coordinate = coordinate
    }
    
}
