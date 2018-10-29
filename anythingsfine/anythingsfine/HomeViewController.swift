//
//  HomeViewController.swift
//  anythingsfine
//
//  Created by Denny Ho on 10/25/18.
//

import UIKit
import Parse

class HomeViewController: UIViewController {
    
    @IBOutlet weak var recLabel: UILabel!
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
        //let randNum = Int.random(in: 0..<categoryList.count)
        let randNum = Int(arc4random_uniform(UInt32(categoryList.count)))
        //let randNum = categoryList.count - 1
        let searchTerm = categoryList[randNum]
        Business.searchWithTerm(term: searchTerm, completion: { (businesses: [Business]?, error: Error?) -> Void in
            
            //self.businesses = businesses
            //self.tableView.reloadData()
            if let businesses = businesses {
                if businesses.count == 0 {
                    print("Try again!")
                    return;
                }
                let randNum2 = businesses.count - 1
                let business = businesses[randNum2]
                print(business.name!)
                print(business.address!)
                self.recLabel.text = business.name! + "\n" + business.address!
                
//                for business in businesses {
//                    print(business.name!)
//                    print(business.address!)
//                }
            }
            
        }
        )
    }
    
    
}
