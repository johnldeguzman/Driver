//
//  ViewController.swift
//  Driver
//
//  Created by John De Guzman on 2016-12-10.
//  Copyright © 2016 John De Guzman. All rights reserved.
//

import UIKit
import SwiftyTimer
import SwiftLocation
import MapKit
import Presentr
class ViewController: UIViewController, CLLocationManagerDelegate{

    @IBOutlet weak var Order: UILabel!
    @IBOutlet weak var maps: MKMapView!
    @IBOutlet weak var searchOrder: UITextField!
    var orderId: String!
    var locationManager: CLLocationManager!
    var presenter: Presentr!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Location.allowsBackgroundEvents = true
        maps.showsUserLocation = true
        let width = ModalSize.custom(size: 300)
        let height = ModalSize.custom(size: 270)
        let modalcenterPosition = ModalCenterPosition.center
        let customType = PresentationType.custom(width: width, height: height, center: modalcenterPosition)
        
        
        presenter = {
            let presenter = Presentr(presentationType: customType)
            //                presenter.transitionType = .coverVerticalFrom
            presenter.roundCorners = true
            return presenter
        }()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "order") as! OrderViewController
        customPresentViewController(presenter, viewController: controller, animated: true, completion: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.startTrack), name: Notification.Name("showOverlayView"), object: nil)
    
    self.navigationController?.isNavigationBarHidden = true
    
   
        
        setupLocationManager()
    }
    
    func setupLocationManager(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.maps.setRegion(region, animated: true)
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func startTimer(){
        Timer.every(1.seconds, { [unowned self] in
       
            self.trackOrder()
        
        })
    }
    
    func startTrack(){
        startTimer()
        let defaults = UserDefaults.standard
        let orderId = defaults.integer(forKey: "OrderId")
        Order.text = "Order Id: \(orderId)"
    }
    
    func saveOrderId(order:String){
        let defaults = UserDefaults.standard
        defaults.setValue(order, forKey: "OrderId")
        startTimer()
    }

    @IBAction func track(_ sender: UIButton) {
        orderId = searchOrder.text
        saveOrderId(order: orderId)
        
    }

    
    func trackOrder(){
        Location.getLocation(withAccuracy: .house, onSuccess: {foundLocation in
            
        let location = foundLocation
        
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        print(latitude, longitude)
        let numLat = NSNumber(value: (latitude as Double))
        let stLat:String = numLat.stringValue
       
        let numLong = NSNumber(value: (longitude as Double))
        let stLong:String = numLong.stringValue
        
        OrderManager().trackOrder(latitude: stLat, Longitude: stLong)
            
        }, onError: {lastvalidLocation, error in
            
            print(error)
        })

    }
}

