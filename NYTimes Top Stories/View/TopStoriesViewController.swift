//
//  TopStoriesViewController.swift
//  NYTimes Top Stories
//
//  Created by Pankaj Gaikar on 30/10/19.
//  Copyright © 2019 Pankaj Gaikar. All rights reserved.
//

import UIKit

class TopStoriesViewController: UIViewController {

    var articleViewModel: ArticleViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = articleViewModel?.selectedSection.uppercased()
        articleViewModel?.fetchTopStories()        
    }

}
