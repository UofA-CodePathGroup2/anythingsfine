//
//  DetailViewController.swift
//  anythingsfine
//
//  Created by Denny Ho on 11/6/18.
//

import Parse
import ParseUI


class DetailViewController: UIViewController {

    @IBOutlet weak var postImageView: PFImageView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    var post: Post!
    
    
    
    
    
    
    
    func updateUserInformation() {
        if let post = self.post {
            self.postImageView.file = post["media"] as? PFFile
            self.postImageView.loadInBackground()
            self.captionLabel.text = post["caption"] as? String
            if let likes = post["likesCount"] as? Int {
                self.likesLabel.text = "Likes: \(likes)"
            }
            if let comments = post["commentsCount"] as? Int {
                self.commentsLabel.text = "Comments: \(comments)"
            }
            var username : String?
            if let user = post["author"] as? PFUser {
                print(user.username)
                username = user.username
            }
            self.usernameLabel.text = username
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUserInformation()
        
    }
    

}
