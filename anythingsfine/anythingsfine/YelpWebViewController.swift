//
//  YelpWebViewController.swift
//  anythingsfine
//
//  Created by Chris Q. on 11/27/18.
//

import UIKit
import WebKit

class YelpWebViewController: UIViewController {

    @IBOutlet weak var yelpWebView: WKWebView!
    var url: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let url = URL(string: "http://google.com")
        //print("urlString in yWVC is " + urlString)
        //let url = URL(string: urlString)
        let request = URLRequest(url: url ?? URL(string: "http://google.com")!)
        yelpWebView.load(request)
        
    }
    
}
