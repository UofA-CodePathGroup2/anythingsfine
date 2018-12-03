//
//  PostViewController.swift
//  anythingsfine
//
//  Created by Mely Bohlman on 10/31/18.
//

import UIKit

class PostViewController: UIViewController,  UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var captionTextField: UITextField!
    
    @IBOutlet weak var restaurantTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func onSelectPhoto(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.delegate = self
        
        vc.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camera is available 📸")
            vc.sourceType = .camera
        } else {
            print("Camera 🚫 available so we will use photo library instead")
            vc.sourceType = .photoLibrary
        }
        
        self.present(vc, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        imageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onPostAF(_ sender: Any) {
        if (self.imageView.image == nil) {
            return;
        }
        
        var newSize = self.imageView.image?.size
        
        newSize!.width = (newSize?.width)!/1.5
        newSize!.height = (newSize?.height)!/1.5
        
        self.imageView.image = resize(image: self.imageView.image!, newSize: newSize!)
        Post.postUserImage(image: imageView.image!, withCaption: captionTextField.text, restaurant: restaurantTextField.text) { (posted: Bool, error: Error?) in
            if (posted) {
                self.performSegue(withIdentifier: "HomeSegue", sender: nil)
            }
            else {
               print("Error in posting")
                self.performSegue(withIdentifier: "HomeSegue", sender: nil)
            }
        }
    }
    
    func resize(image: UIImage, newSize: CGSize) -> UIImage {
        //let resizeImageView = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
        let resizeImageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: newSize.width, height: newSize.height)))
        resizeImageView.contentMode = UIView.ContentMode.scaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
}
