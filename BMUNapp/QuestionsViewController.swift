//
//  QuestionsViewController.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 12/6/15.
//  Copyright © 2015 Jake Moskowitz. All rights reserved.
//

import UIKit
import Parse

protocol QuestionsViewControllerDelegate {
    func textViewFill(text: String)
    func sendOverText() -> String
}

class QuestionsViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, QuestionsViewControllerDelegate {
    
    @IBOutlet weak var topicTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var detailTextView: UITextView!
    
    init() {
        super.init(nibName: "QuestionsViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textColor = UIColor.whiteColor()
        let textFont = UIFont(name: "Avenir", size: 40.0)
        let titleTextAttributes: [String:NSObject] = [
            NSFontAttributeName: textFont!,
            NSForegroundColorAttributeName: textColor,
        ]
        self.navigationController!.navigationBar.titleTextAttributes = titleTextAttributes

        edgesForExtendedLayout = .None
        let sendButton = UIBarButtonItem(title: "Send", style: .Plain, target: self, action: "didPressSend")
        navigationItem.rightBarButtonItem = sendButton
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        detailTextView.layer.cornerRadius = 5.0
        detailTextView.editable = false
        
        topicTextField.delegate = self
        emailTextField.delegate = self
        
        let textViewTapped = UITapGestureRecognizer(target: self, action: "textTapped")
        detailTextView.addGestureRecognizer(textViewTapped)
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(email)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textTapped() {
        let vc = TextViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func didPressSend() {
        if topicTextField.text != "" && emailTextField.text != "" && detailTextView.text != "" {
            
            if isValidEmail(emailTextField.text!) {
        
                let params = [
                    "topic": topicTextField.text!,
                    "email": emailTextField.text!,
                    "body": detailTextView.text
                ]
        
                PFCloud.callFunctionInBackground("sendEmail", withParameters: params) { (res: AnyObject?, err: NSError?) -> Void in
                    print("Res: \(res), err: \(err)")
                }
            
                let finishedSending = UIAlertController(title: "Email Sent", message: "Your email has successfully been sent to our staff.", preferredStyle: .Alert)
                finishedSending.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
                self.presentViewController(finishedSending, animated: true, completion: nil)
                emailTextField.text = ""
                topicTextField.text = ""
                detailTextView.text = ""
            } else {
                let alert = UIAlertController(title: "Invalid Email", message: "Please Re-enter", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
            
        }
        
    }
    
    //MARK: Delegate
    
    func textViewFill(text: String) {
        detailTextView.text = text
    }
    
    func sendOverText() -> String {
        return detailTextView.text
    }


}
