//
//  RecipeViewController.swift
//  anythingsfine
//
//  Created by Chris Q. on 11/10/18.
//

import UIKit

class RecipeViewController: UIViewController {
    
    
    @IBOutlet weak var foodPic: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    var recipeList: [Recipe] = []
    var term: String = ""
    var canGo: Bool = false
    var recipe: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EdamamAPIManager().fetchRecipes(term: term) { (recipes: [Recipe]?, error: Error?) in
            if let recipes = recipes {
                self.recipeList = recipes
                //print(recipes)
                //print(recipeList)
                if(self.recipeList.count != 0){
                    let randNum = Int(arc4random_uniform(UInt32(self.recipeList.count)))
                    self.recipe = self.recipeList[randNum]
                    print(self.recipe)
                    self.recipeTitle.text = self.recipe.title
                    let picString = self.recipe.picString
                    self.foodPic.setImageWith(URL(string: picString!)!)
                    print("RECIPE printed for " + self.term)
                    
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*
         if(segue.identifier == "webSegue"){
         let vc = segue.destination as! WebViewController
         }
         */
        
        let vc = segue.destination as! WebViewController
        vc.urlString = recipe.webString ?? "http://google.com"
        print("webString is " + recipe.webString!)
        
    }
    
    /*
     @IBAction func onRequest(_ sender: Any) {
     EdamamAPIManager().fetchRecipes(term: term) { (recipes: [Recipe]?, error: Error?) in
     if let recipes = recipes {
     self.recipeList = recipes
     //print(recipes)
     //print(recipeList)
     if(self.recipeList.count != 0){
     let randNum = Int(arc4random_uniform(UInt32(self.recipeList.count)))
     let recipe = self.recipeList[randNum]
     self.recipeTitle.text = recipe.title
     var recipeIngredientString = ""
     for ingred in recipe.ingredients! {
     recipeIngredientString += ingred
     recipeIngredientString += "\n"
     }
     self.recipeIngredients.text = recipeIngredientString
     print("RECIPE printed for " + self.term)
     }
     }
     }
     
     }
     */
    
    
}
