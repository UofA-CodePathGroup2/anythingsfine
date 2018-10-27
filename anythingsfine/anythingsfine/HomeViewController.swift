//
//  HomeViewController.swift
//  anythingsfine
//
//  Created by Denny Ho on 10/25/18.
//

import UIKit
import Parse

class HomeViewController: UIViewController {
    
    var businesses: [Business]!
    var categoryList: [String] = ["Japanese","Thai","Chinese","Burgers","African","American","Fast Food","French","German","Italian","Mexican","Spanish"]


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogOut(_ sender: Any) {
        PFUser.logOutInBackground { (error: Error?) in
            NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)
            
        }
    }

    @IBAction func onTapRequest(_ sender: Any) {
        let searchTerm = categoryList[Int.random(in: 0..<categoryList.count)]
        Business.searchWithTerm(term: searchTerm, completion: { (businesses: [Business]?, error: Error?) -> Void in
            
            //self.businesses = businesses
            //self.tableView.reloadData()
            if let businesses = businesses {
                if businesses.count == 0 {
                    print("Try again!")
                    return;
                }
                let business = businesses[Int.random(in: 0..<businesses.count)]
                print(business.name!)
                print(business.address!)
//                for business in businesses {
//                    print(business.name!)
//                    print(business.address!)
//                }
            }
            
        }
        )
    }
    
    
}
