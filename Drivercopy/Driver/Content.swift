////
////  Content.swift
////  PopRx
////
////  Created by John De Guzman on 2016-11-02.
////  Copyright © 2016 John De Guzman. All rights reserved.
////
//
//import Foundation
//import UIKit
//import Alamofire
//class content: UIView{
//    
//    @IBOutlet var view: UIView!
//    @IBOutlet weak var headerimage: UIImageView!
//    
//      var contentView : UIView?
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        xibSetup()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        xibSetup()
////        Bundle.main.loadNibNamed("content", owner: self, options: nil)
////        self.addSubview(self.view)
//    }
//    
//    func xibSetup() {
//        contentView = loadViewFromNib()
//        
//        // use bounds not frame or it'll be offset
//        contentView!.frame = bounds
//        
//        // Make the view stretch with containing view
//        contentView!.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
//        
//        headerimage.pin_setImage(from: URL(string: "https://cdn-images-1.medium.com/focal/1600/480/43/42/1*B8-lyJD219JCCO48ZzNmpQ.jpeg"))
//        
//        contentView!.layer.cornerRadius = 10
//        contentView!.layer.masksToBounds = true
//        // Adding custom subview on top of our view (over any custom drawing > see note below)
//        addSubview(contentView!)
//    }
//    
//    func loadViewFromNib() -> UIView! {
//        
//        let bundle = Bundle(for: type(of: self))
//        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
//         Bundle.main.loadNibNamed("content", owner: self, options: nil)
//        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
//        
//        return view
//    }
////
////    required init?(coder aDecoder: NSCoder) {
////        fatalError("init(coder:) has not been implemented")
////    }
//    
//}
