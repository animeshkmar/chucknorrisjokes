//
//  ViewController.swift
//  Chuck Norris Jokes
//
//  Created by Animesh Kumar on 14/04/20.
//  Copyright © 2020 Animesh K. All rights reserved.
//

import UIKit

class CategoryListingScreen: UIViewController {
    
    let tableView               = UITableView()
    var categories: [String]    = []
    let services                = Services()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chuck Norris Jokes"
        categories = services.fetchCategories()
        configTableView()
    }
    
    func configTableView() -> Void {
        
        view.addSubview(tableView)
        
        // SET TABLE VIEW DELEGATES
        tableView.delegate      = self
        tableView.dataSource    = self
        
        // SET TABLEVIEW ROW HEIGHT
        tableView.estimatedRowHeight    = 80
        tableView.rowHeight             = UITableView.automaticDimension
        
        // REGISTER CELLS
        tableView.register(CategoryCell.self, forCellReuseIdentifier: "CategoryCell")
        
        
        // SET TABLE VIEW CONSTRAINTS
        tableView.translatesAutoresizingMaskIntoConstraints                                         = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive               = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive     = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive         = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive       = true
    }
}

extension CategoryListingScreen: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as! CategoryCell
        let category = categories[indexPath.row].capitalized
        cell.configCategoryCell(categoryName: category)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destination = JokeScreen()
        let category = self.categories[indexPath.row]
        destination.category = category
        self.navigationController?.pushViewController(destination, animated: true)
    }
}


extension CategoryListingScreen {
    
    func navigateToJokeScreen(joke: String) -> Void {
    }
    
}
