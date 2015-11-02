//
//  About.swift
//  Mosquito Bite!
//
//  Created by Shane McCoy on 10/11/15.
//  Copyright © 2015 Vector Ecology NCSU. All rights reserved.
//

import Foundation
import UIKit

class AboutPageViewController: UIViewController {
    
    @IBAction func VectorLink(sender: AnyObject) {
        if let url = NSURL(string: "http://vectorecology.org/") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
}