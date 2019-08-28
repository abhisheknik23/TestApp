//
//  ViewController.swift
//  TestApp
//
//  Created by Abhishek Gupta on 22/08/19.
//  Copyright © 2019 Abhishek Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableViewHeadLine: UITableView!
    
    private var articleListVM: DataViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableViewHeadLine.delegate = self
        getHeadLines()
    }
    
    func getHeadLines(){
        let url = URL(string: Constant.BASEURL)!
        Webservice().getArticles(url: url) { articles in
            if let articles = articles {
                
                self.articleListVM = DataViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self.tableViewHeadLine.reloadData()
                }
            }
        }
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier, for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        return cell
    }
}

