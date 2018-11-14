//
//  EatOutRecipeViewController.swift
//  anythingsfine
//
//  Created by Chris Q. on 10/27/18.
//

import UIKit

class EatOutRecipeViewController: UIViewController {

    var term: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "eatOutSegue"){
            print("EATOUT")
        }
        else if(segue.identifier == "recipeSegue"){
            print("RECIPE for " + term)
            let vc = segue.destination as! RecipeViewController
            vc.term = term
        }
    }

}
