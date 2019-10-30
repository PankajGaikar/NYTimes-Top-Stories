//
//  ArticleViewModel.swift
//  NYTimes Top Stories
//
//  Created by Pankaj Gaikar on 30/10/19.
//  Copyright © 2019 Pankaj Gaikar. All rights reserved.
//

import Foundation

class ArticleViewModel {
    
    var selectedSection: String
    
    var articles = [Article]()
    
    init( selectedSection: String ) {
        self.selectedSection = selectedSection
    }
}
