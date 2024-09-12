//
//  MapViewController.swift
//  MultipleViewController
//
//  Created by jin on 5/5/24.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        print("MapViewController.viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("MapViewController.viewWillAppear")
    }


}
