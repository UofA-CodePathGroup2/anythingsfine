//
//  LoginViewController.swift
//  anythingsfine
//
//  Created by Denny Ho on 10/24/18.
//

import UIKit
import Parse

class LoginViewController: UIViewController {


    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func onLogin(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!)
        { (user: PFUser?, error: Error?) in
            if user != nil {
                print("you're logged in!")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else
            {
                print("ERROR")
            }
        }
    }
    
    
    


}
