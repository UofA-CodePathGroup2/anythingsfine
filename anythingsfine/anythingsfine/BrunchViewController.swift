//
//  BrunchViewController.swift
//  anythingsfine
//
//  Created by Chris Q. on 10/27/18.
//

import UIKit
import Parse

class BrunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOutInBackground { (error: Error?) in
            NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)
            
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "breakfastSegue"){
            print("BREAKFAST")
        }
        if(segue.identifier == "lunchSegue"){
            print("LUNCH")
        }
        if(segue.identifier == "dinnerSegue"){
            print("DINNER")
        }
        if(segue.identifier == "snackSegue"){
            print("SNACK")
        }
        if(segue.identifier == "dessertSegue"){
            print("DESSERT")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
