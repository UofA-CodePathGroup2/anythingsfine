//
//  DetailViewController.swift
//  anythingsfine
//
//  Created by Denny Ho on 11/6/18.
//

import Parse
import ParseUI


class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath)
        cell.textLabel?.text = commentsArr[indexPath.item]
        cell.backgroundColor = UIColor.darkGray
        cell.textLabel?.textColor = UIColor.white
        
        return cell
        
    }
    

    @IBOutlet weak var postImageView: PFImageView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var restaurantLabel: UILabel!
    var post: Post!
    var commentsArr : [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var commentField: UITextField!
    
    
    @IBAction func onTapComment(_ sender: Any) {
        if ((commentField.text?.count)! > 0) {
            post.commentsCount += 1
            let currentUser: String = String(PFUser.current()!.username!)
            post.comments.append(currentUser+": "+commentField.text!)
        }
        post.saveInBackground { (saved: Bool, error: Error?) in
            if (saved) {
                self.updateUserInformation()
                self.tableView.reloadData()
                self.commentField.text = ""
            }
            else {
                print("Error in commenting on image")
            }
        }
        
        
    }
    
    
    @IBAction func onTapLike(_ sender: Any) {
        post.likesCount += 1
        post.saveInBackground { (saved: Bool, error: Error?) in
            if (saved) {
                self.updateUserInformation()
            }
            else {
                
            }
        }
        likeButton.titleLabel?.text = "Liked"
        
    }
    
    func updateUserInformation() {
        if let post = self.post {
            self.postImageView.file = post["media"] as? PFFile
            self.postImageView.loadInBackground()
            self.captionLabel.text = post["caption"] as? String
            if let likes = post["likesCount"] as? Int {
                self.likesLabel.text = "\(likes)"
            }
            if let comments = post["commentsCount"] as? Int {
                self.commentsLabel.text = "\(comments)"
            }
            var username : String?
            if let user = post["author"] as? PFUser {
                print(user.username)
                username = user.username
            }
            self.usernameLabel.text = username
            if let restaurantName = post["restaurant"] as? String {
                restaurantLabel.text = restaurantName
            }
            if let comments = post["comments"] as? [String] {
                commentsArr = comments
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUserInformation()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "customcell")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    

}
