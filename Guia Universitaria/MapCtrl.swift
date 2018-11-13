//
//  MapCtrl.swift
//  Guia Universitaria
//
//  Created by JG Workbook on 11/10/18.
//  Copyright © 2018 Archivo Universitario. All rights reserved.
//
import UIKit
import GoogleMaps

class MapCtrl: UIViewController {
    
    override func loadView() {
        //super.viewDidLoad() //to show support child view
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate de UPRRP at zoom level 18.
        let camera = GMSCameraPosition.camera(withLatitude: 18.404168, longitude: -66.046937, zoom: 18.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        //mapView.isMyLocationEnabled = true
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 18.404168, longitude: -66.046937)
        marker.title = "Archivo General"
        marker.snippet = "UPRRP"
        marker.map = mapView
    
    }
}
