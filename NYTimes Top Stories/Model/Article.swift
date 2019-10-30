//
//  Article.swift
//  NYTimes Top Stories
//
//  Created by Pankaj Gaikar on 30/10/19.
//  Copyright © 2019 Pankaj Gaikar. All rights reserved.
//

import Foundation

class Article: Codable {
    var abstract: String
    var byline: String
    var created_date: String
    var des_facet: [String]
    var geo_facet: [String]
    var item_type: [String]
    var kicker: String
    var material_type_facet: String
    var org_facet: [String]
    var per_facet: [String]
    var published_date: String
    var section: String
    var short_url: String
    var subsection: String
    var title: String
    var url: String
}
