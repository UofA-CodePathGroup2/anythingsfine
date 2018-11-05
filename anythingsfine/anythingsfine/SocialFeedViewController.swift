//
//  SocialFeedViewController.swift
//  anythingsfine
//
//  Created by Denny Ho on 11/3/18.
//

import UIKit
import Parse

class SocialFeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var postsTableView: UITableView!
    
    
    var postsList: [PFObject]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postsTableView.delegate = self
       postsTableView.dataSource = self
        postsTableView.rowHeight = 200
        postsTableView.estimatedRowHeight = 120
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControl.Event.valueChanged)
       postsTableView.insertSubview(refreshControl, at: 0)


        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)
    }
    
   @objc func onTimer() {
       let query = PFQuery(className: "Post")
       query.whereKeyExists("text").includeKey("user")
       query.addDescendingOrder("createdAt")
       query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
           if let posts = posts {
                // do something with the array of object returned by the call
                self.postsList = posts
                self.postsTableView.reloadData()

           } else {
               print(error?.localizedDescription as Any)
            }
        }
    }

    @objc func refreshControlAction(_ refreshControl: UIRefreshControl) {
        onTimer()
     // Tell the refreshControl to stop spinning
        refreshControl.endRefreshing()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        cell.post = postsList[indexPath.row]
       return cell
    }

}
