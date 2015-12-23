//
//  CommitteeDetailViewController.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 12/8/15.
//  Copyright © 2015 Jake Moskowitz. All rights reserved.
//

import UIKit

class CommitteeDetailViewController: UIViewController {
    
    @IBOutlet weak var headChairLabel: UILabel!
    @IBOutlet weak var viceChairsLabel: UILabel!
    //@IBOutlet weak var topicsLabel: UILabel!
    
    var tag: String!
    
    let topics = ["Extremist Groups in sub-Saharan Africa, Disarmament of the Arctic Circle", "Workers Rights, Evaluating the Impacts of Sex Tourism", "International Law in Post-Confict regions, Cultural law in a time of western law", "Climate Change-Induced Agricultural Disasters, Prevention and Mitigation of Food-borne Diseases", "Most Effective Use of Aid: Malaria vs. HIV, Drug Addiction: Crime or Health Issue?", "Gender Equity in Education, Electoral Violence in Africa", "Democratization and Ensuring Participation in Fair Elections, Preserving Sovereignty in Times of Disaster Relief", "Cash Transfers as a Form of Aid, Structural Adjustment Programs", "The Syrian Civil War, Open Agenda", "Russia v. Ukraine", "Unrest in the West: Tibet & Xianjiang (Chinese), Foreign Investment in Latin America (English)", "Reducing the Incidence of the Unbanked, Developing Frameworks to Address Infrastructure Gap in Asia", "Situation in Yemen, Protection of Cultural Property in Armed Conflict", "Economic Impacts of Cyber Warfare, Treatment of Immigrants in the European Union", "Open Agenda", "Economic Development Policy: Alternatives to Neoliberalism? (English), Preparing for Environmental Change:  Disaster Risk Management Strategies (Español)", "Cold War Berlin", "Heir to England: Preservation of the House of Tudor", "Entrepreneurship"]
    
    init(tag: String) {
        self.tag = tag
        super.init(nibName: "CommitteeDetailViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .None
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        var topicsText: NSString
            
        switch(tag) {
        case "00":
            topicsText = topics[0]
            headChairLabel.text = "Tiffany Gean"
            viceChairsLabel.text = "Eric Dumas, Sherry Guo, Michael Pollack"
        case "01":
            topicsText = topics[1]
            headChairLabel.text = "Isabel Viegas de Lima"
            viceChairsLabel.text = "Octavio Farfan, Sarah Yue, Himaja Jangle"
        case "02":
            topicsText = topics[2]
            headChairLabel.text = "Kimberly Nguyen"
            viceChairsLabel.text = "Itago Kangashi, Chelsea Evans, Trent Gomberg"
        case "10":
            topicsText = topics[3]
            headChairLabel.text = "Manu Vaish"
            viceChairsLabel.text = "Adam Umemoto, Emily Yan, Jacob Hands"
        case "11":
            topicsText = topics[4]
            headChairLabel.text = "Hunter Conrad"
            viceChairsLabel.text = "Stacey Dojiri, Nicholas Spelta, TJ Ford"
        case "12":
            topicsText = topics[5]
            headChairLabel.text = "Emily Reece"
            viceChairsLabel.text = "Katie Lee, Sita McGuire, Daksh Bhatia"
        case "13":
            topicsText = topics[6]
            headChairLabel.text = "Benjy Malings"
            viceChairsLabel.text = "David McDonogh, Amanda Lee, Patricia Midy"
        case "14":
            topicsText = topics[7]
            headChairLabel.text = "Jonas Majewski"
            viceChairsLabel.text = "Rob Purviance, Nicola Evans, Andy Luo"
        case "20":
            topicsText = topics[8]
            headChairLabel.text = "Trevor Dowds"
            viceChairsLabel.text = "Kendra Singh, Liam Campbell"
        case "21":
            topicsText = topics[9]
            headChairLabel.text = "Liz Zarka"
            viceChairsLabel.text = "Jake Moskowitz, Colin Garcia, Michael McDonald"
        case "22":
            topicsText = topics[10]
            headChairLabel.text = "Rita Hu"
            viceChairsLabel.text = "Haochen Zhou, Lucia Zhang"
        case "23":
            topicsText = topics[11]
            headChairLabel.text = "Mischa Fritz"
            viceChairsLabel.text = "Lilac Peterson, Michael Nakada"
        case "24":
            topicsText = topics[12]
            headChairLabel.text = "Gloria Cheung"
            viceChairsLabel.text = "Zoe Brouns, Alexander Wilfert"
        case "25":
            topicsText = topics[13]
            headChairLabel.text = "Pranay Patil"
            viceChairsLabel.text = "Brandon Doan, Danny Tuthill, Sarah Bauer"
        case "26":
            topicsText = topics[14]
            headChairLabel.text = "Natasha Cougoule"
            viceChairsLabel.text = "Sey Kim, Ashley Njoroge, Emma Lautanen, Hyunwook Kim"
        case "27":
            topicsText = topics[15]
            headChairLabel.text = "Brett Buckingham"
            viceChairsLabel.text = "Adrian Hernandez, Jane Kim"
        case "30":
            topicsText = topics[16]
            headChairLabel.text = "Nate Parke"
            viceChairsLabel.text = "Jai Malhotra, Jing Liong, Jessie Mao, Tushita Saraf, Micheal Eliot"
        case "31":
            topicsText = topics[17]
            headChairLabel.text = "Eric Cherwin"
            viceChairsLabel.text = "Mekhala Hoskote, Arjun Banerjee"
        case "32":
            topicsText = topics[18]
            headChairLabel.text = "Vishal Kalyanasundaram"
            viceChairsLabel.text = "Ben Sher, Jacky Tian"
        default:
            topicsText = "Hit Default"
            headChairLabel.text = "Hit Default"
            viceChairsLabel.text = "Hit Default"
        }
        
        let attributes: [String: AnyObject] = [NSFontAttributeName: UIFont(name: "Thonburi", size: 18)!]
        let rect: CGRect = topicsText.boundingRectWithSize(CGSizeMake(UIScreen.mainScreen().bounds.width - 16, CGFloat.max), options: .UsesLineFragmentOrigin, attributes: attributes, context: nil)
        
        let topicsLabel = UILabel(frame: CGRectMake(8, 213, UIScreen.mainScreen().bounds.width - 16, rect.height))
        topicsLabel.numberOfLines = 0
        topicsLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        topicsLabel.font = UIFont(name: "Thonburi", size: 18)
        topicsLabel.text = topicsText as String
        topicsLabel.textColor = UIColor.whiteColor()
        topicsLabel.textAlignment = .Center
        view.addSubview(topicsLabel)
      
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return [UIInterfaceOrientationMask.Portrait]
    }


}
