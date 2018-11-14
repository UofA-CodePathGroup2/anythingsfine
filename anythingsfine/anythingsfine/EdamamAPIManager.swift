//
//  EdamamAPIManager.swift
//  anythingsfine
//
//  Created by Chris Q. on 11/7/18.
//

import Foundation

class EdamamAPIManager {
    
    // https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed
    // https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}
    //static let baseUrl = "https://api.edamam.com/search?q=dinner"
    static let baseUrl = "https://api.edamam.com/search?q="
    static let app_id = "37062418"
    static let app_key = "f741223ba6b3166228e4ac1efd7e2da7"
    var session: URLSession
    
    init() {
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    func fetchRecipes(term: String, completion: @escaping ([Recipe]?, Error?) -> ()) {
        let url = URL(string: EdamamAPIManager.baseUrl + term + "&app_id=\(EdamamAPIManager.app_id)&app_key=\(EdamamAPIManager.app_key)")!
        //let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        print(url)
        print("\n\n\n")
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                //print(dataDictionary)
                
                let hitsDictionaries = dataDictionary["hits"] as! [[String: Any]]
                //print(hitsDictionaries)
                var recipeDicts: [[String: Any]] = []
                for hd in hitsDictionaries{
                    recipeDicts.append(hd["recipe"] as! [String : Any])
                }
                //print("START")
                //print(recipeDicts)
                //print("END")
                
                
                //let recipeDictionaries = dataDictionary["hits"] as! [[String: Any]]
               
                //let recipeDictionary = hitsDictionaries["recipe"] as!
                //print(recipeDictionaries.count)
                //print(recipeDictionaries)
                
                let recipes = Recipe.recipes(dictionaries: recipeDicts)
                //for r in recipes{
                //     print(r.title)
                //}
                completion(recipes, nil)
            } else {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    
}
