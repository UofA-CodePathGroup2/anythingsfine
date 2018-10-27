//
//  SignUpViewController.swift
//  anythingsfine
//
//  Created by Denny Ho on 10/25/18.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    @IBOutlet weak var fullnameField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let newUser = PFUser()
        newUser.username = usernameField.text!
        newUser.password = passwordField.text!
        //newUser.fullName = fullnameField.text!
        
        newUser.signUpInBackground {
            (success: Bool, error: Error?) in
            if success
            {
                print("created user")
                self.performSegue(withIdentifier: "signedInSegue", sender: nil)
            }
            else{
                print("Error:")
                print(error!.localizedDescription)
                print(error.debugDescription)
                
            }
        }
    }
    
}
