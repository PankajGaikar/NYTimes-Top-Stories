//
//  TopStoriesViewController.swift
//  NYTimes Top Stories
//
//  Created by Pankaj Gaikar on 30/10/19.
//  Copyright © 2019 Pankaj Gaikar. All rights reserved.
//

import UIKit

class TopStoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ArticleFetchDelegate {
    
    var articleViewModel: ArticleViewModel?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = articleViewModel?.selectedSection.uppercased()
        articleViewModel?.delegate = self
        articleViewModel?.fetchTopStories()
    }
    
    //MARK:- TableView Delegates and Datasources
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleViewModel?.numberOfRow(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        if let article = articleViewModel?.cellForRow(indexPath: indexPath) {
            cell.titleLabel.text = article.title
            cell.subTitleLabel.text = article.abstract

            for multimedia in article.multimedia {
                if multimedia.type == .image &&
                multimedia.subtype == .photo {
                    cell.imageIconView.setCustomImage(multimedia.url) //Better approach?
                    break
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "StoryDetailsViewController") as! StoryDetailsViewController
        storyDetailViewController.article = articleViewModel?.articles[indexPath.row]
        self.navigationController?.pushViewController(storyDetailViewController, animated: true)
    }
    
    //MARK:- API responses
    func didLoadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didLoadFailed() {
        DispatchQueue.main.async {
            let alertController = UIAlertController.init(title: "Error Occurred", message: "Could not load data!", preferredStyle: .alert)
            let okAction = UIAlertAction.init(title: "OK", style: .default) { ( action ) in
                //Throw user out. Error occurred.
                //Or retry.
                //Look into parsing errors.
                self.navigationController?.popViewController(animated: true)
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
        }
    }
}
