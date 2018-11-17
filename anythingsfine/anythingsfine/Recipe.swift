//
//  Recipe.swift
//  anythingsfine
//
//  Created by Chris Q. on 11/7/18.
//

import Foundation

class Recipe {
    
    var title: String?
    var ingredients: [String]?
    var webString: String?
    var picString: String?
    
    init(dictionary: [String: Any]) {
        title = dictionary["label"] as? String ?? "No title"
        //print(dictionary["label"])
        ingredients = dictionary["ingredientLines"] as? [String]
        //print(dictionary["ingredientLines"])
        webString = dictionary["url"] as? String
        picString = dictionary["image"] as? String
    }
    
    class func recipes(dictionaries: [[String: Any]]) -> [Recipe] {
        var recipes: [Recipe] = []
        for dictionary in dictionaries {
            let recipe = Recipe(dictionary: dictionary)
            recipes.append(recipe)
        }
        return recipes
    }
}

