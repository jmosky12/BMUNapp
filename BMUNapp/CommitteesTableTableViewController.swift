//
//  CommitteesTableViewController.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 10/10/15.
//  Copyright © 2015 Jake Moskowitz. All rights reserved.
//

import UIKit

class CommitteesTableViewController: UITableViewController {
    
    let topics = ["Extremist Groups in sub-Saharan Africa, Disarmament of the Arctic Circle", "Workers Rights, Evaluating the Impacts of Sex Tourism", "International Law in Post-Confict regions, Cultural law in a time of western law", "Climate Change-Induced Agricultural Disasters, Prevention and Mitigation of Food-borne Diseases", "Most Effective Use of Aid: Malaria vs. HIV, Drug Addiction: Crime or Health Issue?", "Gender Equity in Education, Electoral Violence in Africa", "Democratization and Ensuring Participation in Fair Elections, Preserving Sovereignty in Times of Disaster Relief", "Cash Transfers as a Form of Aid, Structural Adjustment Programs", "The Syrian Civil War, Open Agenda", "Russia v. Ukraine", "Unrest in the West: Tibet & Xianjiang (Chinese), Foreign Investment in Latin America (English)", "Reducing the Incidence of the Unbanked, Developing Frameworks to Address Infrastructure Gap in Asia", "Situation in Yemen, Protection of Cultural Property in Armed Conflict", "Economic Impacts of Cyber Warfare, Treatment of Immigrants in the European Union", "Open Agenda", "Economic Development Policy: Alternatives to Neoliberalism? (English), Preparing for Environmental Change:  Disaster Risk Management Strategies (Español)", "Cold War Berlin", "Heir to England: Preservation of the House of Tudor", "Entrepreneurship"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib: UINib = UINib(nibName: "CommitteeTableCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "CommitteeTableCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func didPressTopics(sender: UIButton) {
        let mssge = topics[sender.tag]
        let alert = UIAlertController(title: "Topics", message: mssge, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title: String!
        switch(section) {
            case 0:
                title = "Bloc A"
            case 1:
                title = "Bloc B"
            case 2:
                title = "Specialized"
            case 3:
                title = "Crisis"
            default:
                title = "Something's wrong"
        }
        return title
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let num: Int!
        switch(section) {
            case 0:
                num = 3
            case 1:
                num = 5
            case 2:
                num = 8
            case 3:
                num = 3
            default:
                num = 5
        }
        return num
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CommitteeTableCell", forIndexPath: indexPath) as! CommitteeTableCell
        let committee = cell.committee
        let headChair = cell.headChair
        let viceChairs = cell.viceChairs
        cell.topicsButton.addTarget(self, action: "didPressTopics:", forControlEvents: .TouchUpInside)
        switch(indexPath.section) {
        case 0:
            switch(indexPath.row) {
            case 0:
                committee.text = "1st Disarmament & International Security"
                headChair.text = "Tiffany Gean"
                viceChairs.text = "Eric Dumas, Sherry Guo, Michael Pollack"
                cell.topicsButton.tag = 0
            case 1:
                committee.text = "3rd Social, Cultural & Humanitarian"
                headChair.text = "Isabel Viegas de Lima"
                viceChairs.text = "Octavio Farfan, Sarah Yue, Himaja Jangle"
                cell.topicsButton.tag = 1
            case 2:
                committee.text = "6th Legal"
                headChair.text = "Kimberly Nguyen"
                viceChairs.text = "Itago Kangashi, Chelsea Evans, Trent Gomberg"
                cell.topicsButton.tag = 2
            default:
                committee.text = "Committee Name"
                headChair.text = "Isabel Viegas de Lima"
                viceChairs.text = "Vice Chairs"
            }
        case 1:
            switch(indexPath.row) {
            case 0:
                committee.text = "Food & Agricultural Organization"
                headChair.text = "Manu Vaish"
                viceChairs.text = "Adam Umemoto, Emily Yan, Jacob Hands"
                cell.topicsButton.tag = 3
            case 1:
                committee.text = "World Health Organization"
                headChair.text = "Hunter Conrad"
                viceChairs.text = "Stacey Dojiri, Nicholas Spelta, TJ Ford"
                cell.topicsButton.tag = 4
            case 2:
                committee.text = "United Nations Human Rights Council"
                headChair.text = "Emily Reece"
                viceChairs.text = "Katie Lee, Sita McGuire, Daksh Bhatia"
                cell.topicsButton.tag = 5
            case 3:
                committee.text = "United Nations Development Programme"
                headChair.text = "Benjy Malings"
                viceChairs.text = "David McDonogh, Amanda Lee, Patricia Midy"
                cell.topicsButton.tag = 6
            case 4:
                committee.text = "World Bank"
                headChair.text = "Jonas Majewski"
                viceChairs.text = "Rob Purviance, Nicola Evans, Andy Luo"
                cell.topicsButton.tag = 7
            default:
                committee.text = "Committee Name"
                headChair.text = "Isabel Viegas de Lima"
                viceChairs.text = "Vice Chairs"
            }
        case 2:
            switch(indexPath.row) {
            case 0:
                committee.text = "Security Council"
                headChair.text = "Trevor Dowds"
                viceChairs.text = "Kendra Singh, Liam Campbell"
                cell.topicsButton.tag = 8
            case 1:
                committee.text = "International Court of Justice"
                headChair.text = "Liz Zarka"
                viceChairs.text = "Jake Moskowitz, Colin Garcia, Michael McDonald"
                cell.topicsButton.tag = 9
            case 2:
                committee.text = "Chinese State Council (Chinese Bilingual)"
                headChair.text = "Rita Hu"
                viceChairs.text = "Haochen Zhou, Lucia Zhang"
                cell.topicsButton.tag = 10
            case 3:
                committee.text = "Asian Infrastructure Investment Bank"
                headChair.text = "Mischa Fritz"
                viceChairs.text = "Lilac Peterson, Michael Nakada"
                cell.topicsButton.tag = 11
            case 4:
                committee.text = "Arab League (THIMUN)"
                headChair.text = "Gloria Cheung"
                viceChairs.text = "Zoe Brouns, Alexander Wilfert"
                cell.topicsButton.tag = 12
            case 5:
                committee.text = "European Union"
                headChair.text = "Pranay Patil"
                viceChairs.text = "Brandon Doan, Danny Tuthill, Sarah Bauer"
                cell.topicsButton.tag = 13
            case 6:
                committee.text = "Press Corps"
                headChair.text = "Natasha Cougoule"
                viceChairs.text = "Sey Kim, Ashley Njoroge, Emma Lautanen, Hyunwook Kim"
                cell.topicsButton.tag = 14
            case 7:
                committee.text = "The Community of Latin American and Caribbean States (Spanish Bilingual)"
                headChair.text = "Brett Buckingham"
                viceChairs.text = "Adrian Hernandez, Jane Kim"
                cell.topicsButton.tag = 15
            default:
                committee.text = "Committee Name"
                headChair.text = "Isabel Viegas de Lima"
                viceChairs.text = "Vice Chairs"
            }
        case 3:
            switch(indexPath.row) {
            case 0:
                committee.text = "Joint Cabinet Crisis"
                headChair.text = "Nate Parke"
                viceChairs.text = "Jai Malhotra, Jing Liong, Jessie Mao, Tushita Saraf, Micheal Eliot"
                cell.topicsButton.tag = 16
            case 1:
                committee.text = "Tudor Court"
                headChair.text = "Eric Cherwin"
                viceChairs.text = "Mekhala Hoskote, Arjun Banerjee"
                cell.topicsButton.tag = 17
            case 2:
                committee.text = "Berkeley Venture Capital"
                headChair.text = "Vishal Kalyanasundaram"
                viceChairs.text = "Ben Sher, Jacky Tian"
                cell.topicsButton.tag = 18
            default:
                committee.text = "Committee Name"
                headChair.text = "Isabel Viegas de Lima"
                viceChairs.text = "Vice Chairs"
            }
        default:
            committee.text = "Committee Name"
            headChair.text = "Head Chair"
            viceChairs.text = "Vice Chairs"
        }
        cell.selectionStyle = .None
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

}
