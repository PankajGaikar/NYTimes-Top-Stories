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
    
    func fetchTopStories() -> Void {
        
        //URL should be kept in Contants and key should not be plain text but should be securely stored.
        var request : URLRequest = URLRequest(url: URL(string: "https://api.nytimes.com/svc/topstories/v2/\(selectedSection).json?api-key=ht0mRVxRh6w6aG6fzFwmsM7jdeIvoNRL")!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let topStories = try decoder.decode(Welcome.self, from: data)
                    self.articles = topStories.articles
                    print("Parsing successful")
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
