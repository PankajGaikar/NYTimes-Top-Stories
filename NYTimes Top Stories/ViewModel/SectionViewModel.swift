//
//  SectionViewModel.swift
//  NYTimes Top Stories
//
//  Created by Pankaj Gaikar on 30/10/19.
//  Copyright © 2019 Pankaj Gaikar. All rights reserved.
//

import Foundation

class SectionViewModel {
    
    var sections: [Section] = []
         
    func fetchPosts() {
        
        let categories = ["arts", "automobiles", "books", "business", "fashion", "food", "health", "home", "insider", "magazine", "movies", "national", "nyregion", "obituaries", "opinion", "politics", "realestate", "science", "sports", "sundayreview", "technology", "theater", "tmagazine", "travel", "upshot", "world"]

        for category in categories {
            let section = Section(title: category, image: "")
            sections.append( section )
        }
        
    }
    
}
