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
        postsTableView.rowHeight = 320
        
        self.onTimer()
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControl.Event.valueChanged)
        postsTableView.insertSubview(refreshControl, at: 0)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
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
        cell.postImageView.clipsToBounds = true
        cell.postImageView.layer.cornerRadius = 10
        cell.captionLabel.text = post["caption"] as? String
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.darkGray
           
            // UIColor.init(displayP3Red: 95/255, green: 165/255, blue: 249/255, alpha: 1)
        cell.selectedBackgroundView = bgColorView

        if let likes = post["likesCount"] as? Int {
            //cell.likesLabel.text = "Likes: \(likes)"
            cell.likesLabel.text = "\(likes)"
            
        }
        if let comments = post["commentsCount"] as? Int {
            //cell.commentsLabel.text = "Comments: \(comments)"
            cell.commentsLabel.text = "\(comments)"
        }
        var username : String?
        if let user = post["author"] as? PFUser {
            print(user.username)
            username = user.username
        }
        //1 = username //post["author"] as? String
        cell.profileButton.setTitle(username, for: .normal)
        cell.profileButton.backgroundColor = .clear
        cell.profileButton.layer.cornerRadius = 5
        //cell.profileButton.layer.borderWidth = 0.5
        cell.profileButton.layer.borderColor = UIColor.white.cgColor
        
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
        else if (segue.identifier == "ProfileSegue") {
            let cell = sender as! UIButton
            if let name = cell.title(for: .normal) {
                let profileViewController = segue.destination as! ProfileFeedViewController
                profileViewController.usernamePassed = name
            }
            
        }
    }
    
}
