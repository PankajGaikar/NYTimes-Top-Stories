//
//  StoryDetailsViewController.swift
//  NYTimes Top Stories
//
//  Created by Pankaj Gaikar on 30/10/19.
//  Copyright © 2019 Pankaj Gaikar. All rights reserved.
//

import UIKit
import SafariServices

class StoryDetailsViewController: UIViewController, SFSafariViewControllerDelegate {

    //Not having scrollview might create problems.
    //Assumption - Article titles are no more than 3 lines
    //Abstract cannot go beyond 5-7 lines.
    //Much space at bottom.
    @IBOutlet weak var imageIconView: UIImageView!
    @IBOutlet weak var storyTitle: UILabel!
    @IBOutlet weak var storyAbstract: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var timePosted: UILabel!
    
    var article: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let article = self.article {
            
            storyTitle.text = article.title
            storyAbstract.text = article.abstract
            author.text = article.byline
            timePosted.text = article.createdDate.timeAgoSinceDate()
            
            for multimedia in article.multimedia {
                if multimedia.type == .image &&
                multimedia.subtype == .photo &&
                multimedia.format == .mediumThreeByTwo210 {
                    imageIconView.setCustomImage(multimedia.url) //Better approach?
                    break
                }
            }
            
            if article.url.count == 0 {
                //Hide read more button.
            }
        }
        else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    //MARK:- Read more action
    @IBAction func readMoreButtonClicked(_ sender: Any) {
        let safariViewController = SFSafariViewController(url: URL.init(string: article?.url ?? "")!)
        safariViewController.delegate = self
        self.present(safariViewController, animated: true, completion: nil)
    }
    
    //MARK:- Safari delegate
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
