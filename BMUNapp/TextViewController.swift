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
        edgesForExtendedLayout = .None
        textView.layer.cornerRadius = 0.0
        textView.becomeFirstResponder()
        textView.text = delegate?.sendOverText()
        
        let textViewTapped = UITapGestureRecognizer(target: self, action: "textTap")
        textView.addGestureRecognizer(textViewTapped)
    }
    
    override func viewWillDisappear(animated: Bool) {
        delegate?.textViewFill(textView.text)
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return [UIInterfaceOrientationMask.Portrait]
    }

    
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
