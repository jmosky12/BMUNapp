//
//  StartingViewController.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 10/9/15.
//  Copyright © 2015 Jake Moskowitz. All rights reserved.
//

import UIKit

/*
TO DO:
- make checklist data persistent as you go back and forwards again
- when you click a checklist item, go to create task with info filled in to text fields
- implement live updates twitter feed linking
- fix iphone 5 pdf badness
- shoot danny
- make sure textview starts at top in checklist table view
- extend bmun logo all the way to frame so i can make things below it a different color
- make tablecells for timeline, delegateguide, and committees expandable
- incorporate room number into committees
*/

class StartingViewController: UIViewController {
    
    @IBOutlet weak var bmunWordLogoIV: UIImageView!
    @IBOutlet weak var bmunLogo1: UIImageView!
    @IBOutlet weak var bmunLogo2: UIImageView!
    @IBOutlet weak var bmunLogo3: UIImageView!
    @IBOutlet weak var conferenceButton: UIButton!
    @IBOutlet weak var checklistButton: UIButton!
    @IBOutlet weak var delegateButton: UIButton!
    @IBOutlet weak var conferenceLabel: UIButton!
    @IBOutlet weak var checklistLabel: UIButton!
    @IBOutlet weak var delegateLabel: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        let longLogo = UIImage(named: "startinglonglogo")
        let bmunLogo = UIImage(named: "bmunlogo")
        
        bmunWordLogoIV.contentMode = UIViewContentMode.ScaleAspectFit
        bmunWordLogoIV.clipsToBounds = true
        bmunWordLogoIV.image = longLogo
        
        bmunLogo1.contentMode = UIViewContentMode.ScaleAspectFit
        bmunLogo1.clipsToBounds = true
        bmunLogo1.image = bmunLogo
        
        bmunLogo2.contentMode = UIViewContentMode.ScaleAspectFit
        bmunLogo2.clipsToBounds = true
        bmunLogo2.image = bmunLogo
        
        bmunLogo3.contentMode = UIViewContentMode.ScaleAspectFit
        bmunLogo3.clipsToBounds = true
        bmunLogo3.image = bmunLogo
        
        delegateLabel.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        delegateLabel.titleLabel?.textAlignment = NSTextAlignment.Center

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
