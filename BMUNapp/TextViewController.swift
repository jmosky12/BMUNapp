//
//  TextViewController.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 12/21/15.
//  Copyright © 2015 Jake Moskowitz. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    var keyboard = true
    var delegate: QuestionsViewControllerDelegate?
    
    init() {
        super.init(nibName: "TextViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = UIRectEdge()
        textView.layer.cornerRadius = 0.0
        textView.becomeFirstResponder()
        textView.text = delegate?.sendOverText()
        
        // Adds a gesture recognizer that will either bring up or release the keyboard
        let textViewTapped = UITapGestureRecognizer(target: self, action: #selector(TextViewController.textTap))
        textView.addGestureRecognizer(textViewTapped)
    }
    
    // Uses the delegate methods in QuestionsViewController to take text in the text view and populate the QuestionViewController.swift detailTextView once this view controller closes
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.textViewFill(textView.text)
    }
    
    // These two functions below prevent landscape mode
    override var shouldAutorotate : Bool {
        return false
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return [UIInterfaceOrientationMask.portrait]
    }

    // Detects whether or not to bring up or release the keyboard
    func textTap() {
        if keyboard == true {
            textView.resignFirstResponder()
            keyboard = false
        } else {
            textView.becomeFirstResponder()
            keyboard = true
        }
    }

}
