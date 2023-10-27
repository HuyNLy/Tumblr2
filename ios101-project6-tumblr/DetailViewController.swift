//
//  DetailViewController.swift
//  ios101-project6-tumblr
//
//  Created by Huy Ly on 10/21/23.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {

    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textView: UITextView!
    var post: Post!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

           
            guard isViewLoaded else { return }
   
            configureUI()
    }

    func configureUI() {
            // Use the caption property to set the text property of the text view
            // Remove HTML tags from the caption string
            if let post = post {
                let caption = post.caption.trimHTMLTags()
                textView.text = caption

                if let firstPhoto = post.photos.first {
                    let url = firstPhoto.originalSize.url
                    print("Image URL: \(url)") // Debugging line
                    Nuke.loadImage(with: url, into: imageView)
                }
            } else {
                print("Post is nil") // Debugging line
            }
        }
    

    
     

}
