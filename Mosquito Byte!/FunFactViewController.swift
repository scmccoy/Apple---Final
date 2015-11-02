//
//  FunFactViewController.swift
//  Mosquito Bite! for VectorEcology.org
//  Developed by Waystone Design - Raleigh, North Carolina 2015
//
//
//  Copyright (c) 2015 Waystone Design. All rights reserved.
//

import UIKit
import Foundation

class FunFactViewController: UIViewController {
    
    
    
    @IBOutlet weak var mainButtonPopup: UIButton!
    // Label in 'PopUp' for displaying Random Fact
    @IBOutlet weak var labelRandomDisplay: UILabel!
    // Dismiss Button - segue back to Main Screen.
    @IBAction func dismissButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonElementsPopup()
        // Navigation BAR - top screen - make Translucent
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        
        // Testing Area Below!
        
        
        
        
        // Random Fact Generator for Label in 'PopUp'
        let array = ["North Dakota is the state with the fewest types (species) of mosquitoes with 24 species; Florida has the most with 76",
            "Mosquitoes spit into you when they bite, and that’s what makes you itch",
            "Eliminating places for mosquitoes to grow is an effective and free way to control them",
            "There is a spider in Africa that specializes in eating mosquitoes",
            "All mosquitoes grow in water",
            "Eggs of some desert mosquitoes can survive several years before hatching",
            "There is a tropical mosquito that is fed by ants",
            "Some mosquitoes have been living close to people since the beginning of cities, about 3000 years ago",
            "There are some mosquitoes that prefer birds, and some that prefer frogs",
            "Salt marsh mosquitoes have been found flying 15 miles from where they emerged",
            "The most common lethal pathogen of dogs in the United States in transmitted by mosquitoes, dog heartworm",
            "Due to its role as the vector of malaria and viruses, mosquitoes kill more people every year than any other animal",
            "The biggest mosquito in the world doesn’t drink blood, and eats other mosquitoes!",
            "Certain mosquitoes become more abundant in times of drought, and can drive epidemics of deadly brain swelling",
            "Most types of mosquitoes (species) don’t bite people",
            "Some mosquitoes have spread around the world, and the same species can be found on all continents except Antarctica",
            "Male mosquitoes are attracted to the buzz of female mosquitoes, and female mosquitoes judge males by their buzz",
            "Some people are more attractive to mosquitoes than others, but we don’t know why yet.  We’re working on it",
            "Fossil mosquitoes have been found from the time of the dinosaurs, but no dino DNA has been preserved ☹",
            "Mosquito populations can quickly evolve resistance to pesticides, but resistance to repellents is rare"
        ]
        let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
        labelRandomDisplay.text = array[randomIndex]
        
        
        
        // Do any additional setup after loading the view.
    }
    
    // Function for button attributes - Popup Page
    func buttonElementsPopup() {
        
        let red = UIColor(red: 200.0/255.0, green: 26.0/255.0, blue: 0.0/255.0, alpha: 0.9)
        mainButtonPopup.layer.borderColor = red.CGColor
        mainButtonPopup.layer.borderWidth = 2.0
        mainButtonPopup.layer.shadowColor = UIColor.blackColor().CGColor
        mainButtonPopup.layer.shadowOffset = CGSizeMake(5, 5)
        mainButtonPopup.layer.shadowRadius = 10
        mainButtonPopup.layer.shadowOpacity = 0.5
        mainButtonPopup.layer.masksToBounds = false
        mainButtonPopup.layer.opacity = 0.8
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
