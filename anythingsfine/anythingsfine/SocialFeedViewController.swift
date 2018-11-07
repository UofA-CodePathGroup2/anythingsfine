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
        
        let refreshControl = UIRefreshControl()
        
        
        postsTableView.delegate = self
        postsTableView.dataSource = self
        postsTableView.rowHeight = 300
        
        self.onTimer()
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControl.Event.valueChanged)
        postsTableView.insertSubview(refreshControl, at: 0)
        
        
    }
    
    
    func onTimer(){
        let query = PFQuery(className: "Post")
        query.order(byDescending: "createdAt")
        query.includeKey("author")
        //query.includeKey("createdAt")
        query.limit = 20
        
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let posts = posts {
                self.postsList = posts as! [Post]
            } else {
                print(error?.localizedDescription)
            }
            self.postsTableView.reloadData()
        }
    }
    
    @objc func refreshControlAction(_ refreshControl: UIRefreshControl) {
        onTimer()
        // Tell the refreshControl to stop spinning
        refreshControl.endRefreshing()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(postsList.count)
        return self.postsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        let post = postsList[indexPath.row]
        cell.postImageView.file = post["media"] as? PFFile
        cell.postImageView.loadInBackground()
        cell.captionLabel.text = post["caption"] as? String
        if let likes = post["likesCount"] as? Int {
            cell.likesLabel.text = "Likes: \(likes)"
        }
        if let comments = post["commentsCount"] as? Int {
            cell.commentsLabel.text = "Comments: \(comments)"
        }
        var username : String?
        if let user = post["author"] as? PFUser {
            print(user.username)
            username = user.username
        }
        cell.usernameLabel.text = username //post["author"] as? String
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "DetailSegue") {
            let cell = sender as! UITableViewCell
            if let indexPath = postsTableView.indexPath(for: cell) {
                let post = postsList[indexPath.row]
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.post = post as! Post
                
            }
        }
    }
    
}
