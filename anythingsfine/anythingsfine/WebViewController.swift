//
//  WebViewController.swift
//  anythingsfine
//
//  Created by Chris Q. on 11/16/18.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    
    @IBOutlet weak var webView: WKWebView!
    var urlString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let url = URL(string: "http://google.com")
        print("urlString in WVC is " + urlString)
        let url = URL(string: urlString)
        let request = URLRequest(url: url ?? URL(string: "http://google.com")!)
        webView.load(request)
        
    }
    
}
