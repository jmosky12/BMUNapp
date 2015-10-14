//
//  CreateTaskViewController.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 10/9/15.
//  Copyright © 2015 Jake Moskowitz. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var detailsTextView: UITextView!
    @IBOutlet weak var createButton: UIButton!
    var delegate: ChecklistTableViewControllerDelegate?
    var info = NSMutableArray()
    let defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        createButton.layer.cornerRadius = 7.0
        detailsTextView.layer.cornerRadius = 7.0
        titleTextField.layer.cornerRadius = 7.0
        titleTextField.text = ""
        detailsTextView.text = ""
        titleTextField.delegate = self
        
        let tapOutside = UITapGestureRecognizer(target: self, action: "hideKeyboard")
        view.addGestureRecognizer(tapOutside)

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func didPressCreateButton() {
        if titleTextField.text != "" {
            let titleString = titleTextField.text!
            let detailsString = detailsTextView.text!
            let cellData = delegate!.getCellData()
            info.addObject(titleString)
            info.addObject(detailsString)
            cellData.addObject(info)
            delegate!.replaceCellData(cellData)
            defaults.setObject(cellData, forKey: "cellData")
            self.navigationController?.popViewControllerAnimated(true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func hideKeyboard() {
        if detailsTextView.isFirstResponder() {
            detailsTextView.resignFirstResponder()
        }
    }

}
