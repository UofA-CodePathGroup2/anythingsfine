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

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var captionTextField: UITextField!
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
        
        Post.postUserImage(image: imageView.image!, withCaption: captionTextField.text, withCompletion: nil)
        
        performSegue(withIdentifier: "HomeSegue", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
