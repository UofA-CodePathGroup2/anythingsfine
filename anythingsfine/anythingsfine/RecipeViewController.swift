//
//  RecipeViewController.swift
//  anythingsfine
//
//  Created by Chris Q. on 11/10/18.
//

import UIKit

class RecipeViewController: UIViewController {

    
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeIngredients: UILabel!
    var recipeList: [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onRequest(_ sender: Any) {
        EdamamAPIManager().fetchRecipes { (recipes: [Recipe]?, error: Error?) in
            if let recipes = recipes {
                self.recipeList = recipes
                //print(recipes)
            }
        }
        //print(recipeList)
        if(recipeList.count != 0){
            let randNum = Int(arc4random_uniform(UInt32(recipeList.count)))
            let recipe = recipeList[randNum]
            recipeTitle.text = recipe.title
            var recipeIngredientString = ""
            for ingred in recipe.ingredients! {
                recipeIngredientString += ingred
                recipeIngredientString += "\n"
            }
            recipeIngredients.text = recipeIngredientString
        }
    }
}
