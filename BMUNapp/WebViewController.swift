//
//  WebViewController.swift
//  BMUNapp
//
//  Created by Jake Moskowitz on 10/11/15.
//  Copyright © 2015 Jake Moskowitz. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    @IBOutlet var webView: UIWebView!
    var fileName: String!
    
    init(file: String) {
        super.init(nibName: nil, bundle: nil)
        fileName = file
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path: String = NSBundle.mainBundle().pathForResource(fileName, ofType: "pdf")!
        let targetURL: NSURL = NSURL(fileURLWithPath: path)
        let request: NSURLRequest = NSURLRequest(URL: targetURL)
        webView.loadRequest(request)
        webView.scalesPageToFit = true
        view.addSubview(webView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
