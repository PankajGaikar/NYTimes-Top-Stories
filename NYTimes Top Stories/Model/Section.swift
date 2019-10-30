//
//  Section.swift
//  NYTimes Top Stories
//
//  Created by Pankaj Gaikar on 30/10/19.
//  Copyright © 2019 Pankaj Gaikar. All rights reserved.
//

import Foundation

struct Section: Identifiable, Decodable {
    let id = UUID()
    let title: String
    let image: String //Needs images to setup in collection along with section category
}
