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
    
    init(dictionary: [String: Any]) {
        title = dictionary["label"] as? String ?? "No title"
        //print(dictionary["label"])
        ingredients = dictionary["ingredientLines"] as? [String]
        //print(dictionary["ingredientLines"])
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

