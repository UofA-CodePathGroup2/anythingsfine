//
//  Ingredient.swift
//  anythingsfine
//
//  Created by Chris Q. on 11/7/18.
//

import Foundation

class Ingredient {
    
    var quantity: Float?
    var food: String?
    
    init(dictionary: [String: Any]) {
        quantity = dictionary["quantity"] as! Float
        food = dictionary["food"] as! String
    }
    
    class func ingredients(dictionaries: [[String: Any]]) -> [Ingredient] {
        var ingredients: [Ingredient] = []
        for dictionary in dictionaries {
            let ingredient = Ingredient(dictionary: dictionary)
            ingredients.append(ingredient)
        }
        return ingredients
    }
    
}
