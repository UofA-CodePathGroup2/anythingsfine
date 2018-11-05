//
//  PostCell.swift
//  anythingsfine
//
//  Created by Denny Ho on 11/3/18.
//

import UIKit
import Parse


class PostCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    
    var post: PFObject! {
        didSet{
            
            self.captionLabel.text = post.object(forKey:"caption") as? String
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
