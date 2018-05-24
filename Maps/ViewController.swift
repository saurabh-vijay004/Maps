//
//  ViewController.swift
//  Maps
//
//  Created by Saurabh on 5/24/18.
//  Copyright © 2018 Saurabh. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let latitude: CLLocationDegrees = 27.1750199
        
        let longitude: CLLocationDegrees = 78.0399665
        
        let latdelta: CLLocationDegrees = 0.05
        
        let LonDelta: CLLocationDegrees = 0.05
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latdelta, longitudeDelta: LonDelta)
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.title = "Taj Mahal"
        
        annotation.subtitle = "One day i'll go here..."
        annotation.coordinate = location
        
        map.addAnnotation(annotation)
        
        // Create map Annotation on Long Press
        
        let uiLongPressGestureRecogniser = UILongPressGestureRecognizer(target: self, action: #selector(self.longpress(gestureRecogniser:)))
        
        uiLongPressGestureRecogniser.minimumPressDuration = 2
        
        map.addGestureRecognizer(uiLongPressGestureRecogniser)
        
    }
    
    func longpress(gestureRecogniser: UIGestureRecognizer){
        
        let touchPoint = gestureRecogniser.location(in: self.map)
        
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        
        let annotaion = MKPointAnnotation()
        
        annotaion.coordinate = coordinate
        
        annotaion.title = "New Place"
        
        annotaion.subtitle = "Maybe I'll go here too.."
        
        map.addAnnotation(annotaion)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

