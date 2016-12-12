//
//  OrderViewController.swift
//  Driver
//
//  Created by John De Guzman on 2016-12-12.
//  Copyright © 2016 John De Guzman. All rights reserved.
//

import Foundation
import UIKit

class OrderViewController: UIViewController{
    @IBOutlet weak var OrderText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        let order = OrderText.text
        let defaults = UserDefaults.standard
        defaults.setValue(order, forKey: "OrderId")
                NotificationCenter.default.post(name: Notification.Name("showOverlayView"), object: nil)
    }
}
